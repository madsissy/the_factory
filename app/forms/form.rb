class Form
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  include Attributable

  # Start implement assign_attributes
  # Remove when we are on Rails 5.1
  def assign_attributes(new_attributes)
    if !new_attributes.respond_to?(:stringify_keys)
      raise ArgumentError, "When assigning attributes, you must pass a hash as an argument."
    end
    return if new_attributes.blank?

    attributes                  = new_attributes.stringify_keys
    multi_parameter_attributes  = []
    nested_parameter_attributes = []

    attributes = sanitize_for_mass_assignment(attributes)

    attributes.each do |k, v|
      if k.include?("(")
        multi_parameter_attributes << [ k, v ]
      elsif v.is_a?(Hash)
        nested_parameter_attributes << [ k, v ]
      else
        _assign_attribute(k, v)
      end
    end

    assign_nested_parameter_attributes(nested_parameter_attributes) unless nested_parameter_attributes.empty?
    assign_multiparameter_attributes(multi_parameter_attributes) unless multi_parameter_attributes.empty?
  end

  def sanitize_for_mass_assignment(attributes)
    if attributes.respond_to?(:permitted?) && !attributes.permitted?
      raise ActiveModel::ForbiddenAttributesError
    else
      attributes
    end
  end

  def _assign_attribute(k, v)
    public_send("#{k}=", v)
  rescue NoMethodError, NameError
    if respond_to?("#{k}=")
      raise
    else
      raise UnknownAttributeError.new(self, k)
    end
  end

  def assign_nested_parameter_attributes(pairs)
    pairs.each { |k, v| _assign_attribute(k, v) }
  end

  def assign_multiparameter_attributes(pairs)
    execute_callstack_for_multiparameter_attributes(
      extract_callstack_for_multiparameter_attributes(pairs)
    )
  end

  def execute_callstack_for_multiparameter_attributes(callstack)
    errors = []
    callstack.each do |name, values_with_empty_parameters|
      begin
        send("#{name}=", MultiparameterAttribute.new(self, name, values_with_empty_parameters).read_value)
      rescue => ex
        errors << AttributeAssignmentError.new("error on assignment #{values_with_empty_parameters.values.inspect} to #{name} (#{ex.message})", ex, name)
      end
    end
    unless errors.empty?
      error_descriptions = errors.map { |ex| ex.message }.join(",")
      raise MultiparameterAssignmentErrors.new(errors), "#{errors.size} error(s) on assignment of multiparameter attributes [#{error_descriptions}]"
    end
  end

  def extract_callstack_for_multiparameter_attributes(pairs)
    attributes = {}

    pairs.each do |(multiparameter_name, value)|
      attribute_name = multiparameter_name.split("(").first
      attributes[attribute_name] ||= {}
      parameter_value = value.empty? ? nil : type_cast_attribute_value(multiparameter_name, value)
      attributes[attribute_name][find_parameter_position(multiparameter_name)] ||= parameter_value
    end

    attributes
  end
  # End implement assign_attributes

end

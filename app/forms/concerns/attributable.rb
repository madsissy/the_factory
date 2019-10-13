# This concerns add .attributes methods for non activeRecord models
# See here: https://stackoverflow.com/questions/5462484/activemodel-attributes
module Attributable
  extend ActiveSupport::Concern

  class_methods do
    def form_attributes(*args)
      @attribute_names = args
      attr_accessor(*args)
    end

    def attribute_names
      @attribute_names
    end
  end

  included do
    def attributes
      return {} unless self.class.attribute_names
      self.class.attribute_names.inject({}) do |hash, key|
        hash.merge({ key.to_s => self.send(key) })
      end
    end
  end

end

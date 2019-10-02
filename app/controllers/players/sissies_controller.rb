class Players::SissiesController < Players::BaseController
  def new
    @sissy = build_sissy
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
    def build_sissy
      @player.sissies.new(
        firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 35)
      )
    end
end

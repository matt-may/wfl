module Recommender
  class Recommendation
    def initialize(user)
      @user = user
    end
  end

  class Lunch < Recommendation
    def initialize(user)
      super
    end

    def today
    end
  end
end
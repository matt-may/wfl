module Recommender
  class Recommendation
    def initialize(user)
      @user = user
      @ratings = user.ratings
    end
  end

  class Lunch < Recommendation
    def initialize(user)
      super
    end




  end
end

# assuming ratings are equal => choose one we've visited most not-recently
# assuming no last_visited
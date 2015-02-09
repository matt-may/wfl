require 'rails_helper'
require 'recommender/lunch_recommender'

RSpec.describe LunchRecommender do
  let(:user) { FactoryGirl.create(:user) }
  subject { LunchRecommender.new(user) }

  describe '#new' do
    it { is_expected.to be_instance_of LunchRecommender }
  end

  describe '#today' do

  end
end
require 'rails_helper'
require 'recommender/lunch_recommender'

RSpec.describe LunchRecommender do
  let(:user) { create(:user) }
  subject(:recommendation) { LunchRecommender.new(user) }

  describe '#new' do
    it { is_expected.to be_instance_of LunchRecommender }
  end

  describe '#today' do
    it 'returns a result of true' do
      result = recommendation.today.first
      expect(result).to eq(true)
    end

    it 'also returns a Recommendation object' do
      object = recommendation.today.at(1)
      expect(object).to be_instance_of Recommendation
    end

    context 'with one restaurant' do
      it 'recommends we go to the one restaurant' do
        create_list :rating, 1, user: user
        expected = Restaurant.all.first
        actual = recommendation.today.at(1).restaurant

        expect(expected).to eq(actual)
      end
    end
  end
end
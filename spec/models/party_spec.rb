require 'rails_helper'

describe Party, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:zip_code)}
  end

  describe 'instance methods' do
    it '#location' do
      p = create(:party)

      expect(p.location).to eq(
        "#{p.street_address}, #{p.city}, #{p.state}, #{p.zip_code}")
    end
  end
end

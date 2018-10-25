require 'rails_helper'

describe Party type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:zip_code)}
  end
end

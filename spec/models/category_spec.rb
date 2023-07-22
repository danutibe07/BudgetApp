require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is invalid without a name' do
      category = Category.new(icon: fixture_file_upload('delete-icon.jpg'))
      expect(category).to be_invalid
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an icon' do
      category = Category.new(name: 'Test Category')
      expect(category).to be_invalid
      expect(category.errors[:icon]).to include("can't be blank")
    end

    it 'is invalid with a name and icon' do
      category = Category.new(name: 'Test Category', icon: fixture_file_upload('delete-icon.jpg'))
      expect(category).to be_invalid
    end
  end
end

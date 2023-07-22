require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it 'is valid with a name and amount' do
      category = Category.create(name: 'Test Category')
      expense = Expense.new(name: 'Test Expense', amount: 10, category:)
      expect(expense).to be_valid
    end

    it 'is invalid without a name' do
      category = Category.create(name: 'Test Category')
      expense = Expense.new(amount: 10, category:)
      expect(expense).to be_invalid
      expect(expense.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an amount' do
      category = Category.create(name: 'Test Category')
      expense = Expense.new(name: 'Test Expense', category:)
      expect(expense).to be_invalid
      expect(expense.errors[:amount]).to include("can't be blank")
    end

    it 'is invalid with a negative amount' do
      category = Category.create(name: 'Test Category')
      expense = Expense.new(name: 'Test Expense', amount: -10, category:)
      expect(expense).to be_invalid
      expect(expense.errors[:amount]).to include('must be greater than or equal to 0')
    end
  end

  describe 'associations' do
    it 'belongs to a category' do
      expect(Expense.reflect_on_association(:category).macro).to eq(:belongs_to)
    end
  end
end

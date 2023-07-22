require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it 'is invalid without a name' do
      expense = Expense.new(name: nil, amount: 100)
      expect(expense).to be_invalid
      expect(expense.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an amount' do
      expense = Expense.new(name: 'Expense Name', amount: nil)
      expect(expense).to be_invalid
      expect(expense.errors[:amount]).to include("can't be blank")
    end

    it 'is invalid with a negative amount' do
      expense = Expense.new(name: 'Expense Name', amount: -100)
      expect(expense).to be_invalid
      expect(expense.errors[:amount]).to include('must be greater than or equal to 0')
    end
  end

  describe 'associations' do
    it 'belongs to a category' do
      association = Expense.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end

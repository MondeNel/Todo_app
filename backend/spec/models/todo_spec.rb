require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should validate_presence_of(:title) }

  describe 'defaults' do
    it 'defaults completed to false' do
      todo = Todo.new(title: 'Buy milk')
      expect(todo.completed).to eq(false)
    end
  end
end
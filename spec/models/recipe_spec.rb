require 'rails_helper'

describe Recipe do
  it {should have_and_belong_to_many :tags}

  it 'creates a new recipe' do
    recipe = FactoryBot.create(:recipe)
    recipe.name.should eq 'pizza'
    recipe.ingredient.should eq 'cheese, sauce, dough'
    recipe.instruction.should eq 'bake pizza'
  end
end
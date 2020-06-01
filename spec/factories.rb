FactoryBot.define do
  factory(:recipe) do
    name {'pizza'}
    ingredient {'cheese, sauce, dough'}
    instruction {'bake pizza'}
  end
end
class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
end

# new_cocktail = Cocktail.new()
# new_cocktail.valid?
# new_cocktail.errors.messages

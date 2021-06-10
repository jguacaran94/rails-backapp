class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :quantity, presence: true
  validates :price, presence: true

  with_options reject_if: :reject_nested

  private
    def reject_nested(attrs)
      attrs.values.any?(&:blank?)
    end
  end
end

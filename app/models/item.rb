class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_source
  belongs_to :delivery_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :status_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_cost_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_source_id, numericality: { other_than: 0, message: 'Select' }
    validates :delivery_date_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, numericality: { message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end
end

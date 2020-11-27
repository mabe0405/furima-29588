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
  validates :category_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :shipping_source_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }
  validates :price,format: { with: 3[0-9][0-9]|9[0-9][0-9][0-9][0-9][0-9][0-9] ,message: 'Out of setting range' }
end


end

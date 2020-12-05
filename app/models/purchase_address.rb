class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :nickname, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, :name, :description, :category_id, :status_id, :shipping_cost_id, :shipping_source_id, :delivery_date_id, :price, :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
  end

  def save
    user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birth_date: birth_date)
    item = Item.create(name: name, description: description, category_id: category_id, status_id: status_id, shipping_cost_id: shipping_cost_id, shipping_source_id: shipping_source_id, delivery_date_id: delivery_date_id, price: price, user_id: user.id)
    purchase = Purchase.create(user_id: user_id, item_id: item_id, token: token)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end

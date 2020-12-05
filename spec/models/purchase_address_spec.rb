require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンがないと保存できないこと' do
      @purchase_address.postal_code = '1111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
    end
    it '都道府県が未選択(0)だと保存できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
    end
    it '市町村が空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が数字のみでないと保存できないこと' do
      @purchase_address.phone_number = 'a1111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
    end
    it 'userが紐付いていないと保存できないこと' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end

require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
     user = FactoryBot.create(:user)
     merchandise = FactoryBot.create(:merchandise)
     @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, merchandise_id: merchandise.id) 
    sleep 0.1
  end

  describe '購入' do
    context 'できる場合' do
      it "必要な情報が揃っていれば保存ができること" do
        expect(@purchase_address).to be_valid
      end 
      it "建物名が空でも購入できる" do
        expect(@purchase_address).to be_valid
      end
    end 

    context 'できない場合' do
      it "ユーザーが紐づいていなければ登録できないこと" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it "商品が紐づいていなければ登録できないこと" do
        @purchase_address.merchandise_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Merchandise can't be blank")
      end

      it "tokenが紐づいていなければ登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空では登録できないこと" do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it "都道府県が空では登録できないこと" do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "市区町村が空では登録できないこと" do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空では登録できないこと" do
        @purchase_address.street_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
      end

      it "電話番号が空では登録できないこと" do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が半角ハイフンを含む形でなければ購入できない" do
        @purchase_address.post_code = "4242424"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
      end

      it "都道府県に「---」が選択されている場合は購入できない" do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "電話番号が9桁以下では購入できない" do
        @purchase_address.phone_number = 90
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が12桁以上では購入できない" do
        @purchase_address.phone_number = 8042429292420
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号に半角数字以外が含まれている場合は購入できない" do
        @purchase_address.phone_number ="0904242aaaa"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end


    end
  end
end
require 'rails_helper'

RSpec.describe Merchandise, type: :model do
  before do
    @merchandise = FactoryBot.build(:merchandise)
  end

  describe '商品' do
    context '出品できる場合' do
      it "ユーザーと画像が存在すれば登録できる" do
        expect(@merchandise).to be_valid
      end
    end

    context '出品できない場合' do
      it 'userが紐づいていなければ出品できない' do
        @merchandise.user = nil
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("User must exist")
      end

      it '商品画像が空では登録できない' do
        @merchandise.image = nil
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @merchandise.goods_name = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Goods name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @merchandise.explain = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Explain can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @merchandise.category_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Category is not a number")
      end

      it '商品の状態が空では登録できない' do
        @merchandise.condition_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Condition is not a number")
      end

      it '配送料の負担が空では登録できない' do
        @merchandise.delivery_fee_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Delivery fee is not a number")
      end

      it '発送元の地域が空では登録できない' do
        @merchandise.prefecture_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Prefecture is not a number")
      end

      it '発送までの日数が空では登録できない' do
        @merchandise.date_of_shipping_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Date of shipping is not a number")
      end

      it '価格が空では登録できない' do
        @merchandise.price = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が半角でないと登録できない' do
        @merchandise.price = "ああああああ"
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Price is not a number")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @merchandise.category_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @merchandise.condition_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @merchandise.delivery_fee_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @merchandise.prefecture_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @merchandise.date_of_shipping_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Date of shipping must be other than 1")
      end

      it '価格が300円未満では出品できない' do
        @merchandise.price = 299
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9_999_999円を超えると出品できない' do
        @merchandise.price = 10_000_000
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end
  end
end
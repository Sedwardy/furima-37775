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

      it '価格が空では登録できない' do
        @merchandise.price = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が数字でないと登録できない' do
        @merchandise.price = "ああああああ"
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end
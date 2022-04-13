require 'rails_helper'

RSpec.describe Merchandise, type: :model do
  before do
    @merchandise = FactoryBot.build(:merchandise)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
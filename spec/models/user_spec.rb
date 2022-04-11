require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = "aaaaaaaa"
        @user.password_confirmation = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
      end

      it 'passwordが全角だと登録できない' do
        @user.password = "ああああああ"
        @user.password_confirmation = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
      end

      it 'last_nameが半角だと登録できない' do
        @user.last_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが半角だと登録できない' do
        @user.first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'hurigana_last_nameが半角だと登録できない' do
        @user.hurigana_last_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Hurigana last name is invalid")
      end

      it 'hurigana_first_nameが半角だと登録できない' do
        @user.hurigana_first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Hurigana first name is invalid")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'hurigana_last_nameが空では登録できない' do
        @user.hurigana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Hurigana last name can't be blank")
      end

      it 'hurigana_first_nameが空では登録できない' do
        @user.hurigana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Hurigana first name can't be blank")
      end
    end
  end
end
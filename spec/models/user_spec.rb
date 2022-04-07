require 'rails_helper'

RSpec.describe "半角英数字混合" do
  it "passwordが半角英数字混合でなければ登録できない" do
    @user.password = "aaaaaa"
    @user.valid?
    expect(@user.errors_full_messages).to include("Password Include both letters and numbers")
  end
end

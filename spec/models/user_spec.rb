require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザが登録出来ている場合' do
      it 'username, email, password, password_confirmationが正しく入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    it 'usernameが空の場合、登録できない' do
      @user.username = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("あなたの名前が入力されていません。")
    end

    it 'emailが空の場合、登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスが入力されていません。")
    end

    it 'passwordが空の場合、登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordが入力されていません。", "Password confirmationが内容とあっていません。")
    end

    it 'passwordが5文字以下の場合、登録できない' do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは6文字以上に設定して下さい。")
    end

    it 'password_confirmationとpasswordの不一致の場合、登録できない' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
  end
end

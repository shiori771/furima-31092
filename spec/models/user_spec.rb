require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname、email、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが全て存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複していたら登録ができないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれないと登録できないこと' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字未満だと登録できないこと' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは半角英数の混合を入力しないと登録できないこと(数字のみ)' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordは半角英数の混合を入力しないと登録できないこと(半角アルファベットのみ)' do
      @user.password = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空だと登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name Full-width characters')
    end

    it 'first_nameが空だと登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank",'First name Full-width characters')
    end

    it 'last_nameは全角（漢字・ひらがな・カタカナ）で入力しないと登録できないこと' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'first_nameは全角（漢字・ひらがな・カタカナ）で入力しないと登録できないこと' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_name_kanaが空だと登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana Full-width characters')
    end

    it 'first_name_kanaが空だと登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana Full-width characters')
    end

    it 'last_name_kanaは全角カタカナで入力しないと登録できないこと' do
      @user.last_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width characters')
    end

    it 'first_name_kanaは全角カタカナで入力しないと登録できないこと' do
      @user.first_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width characters')
    end

    it 'birth_dateが空だと登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end

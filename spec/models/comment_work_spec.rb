require 'rails_helper'

RSpec.describe CommentWork, type: :model do
  describe '#create' do
    before do
      @CommentWork = FactoryBot.build(:comment_work)
    end

    context 'コメントできる場合' do
      it 'contentが正しく入力されていれば新規登録できる' do
        expect(@commentWork).to be_valid
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context ' test friendship model' do
    before do
      @user = User.create(name: 'jordy', email: 'jordy@garcia.com', password: '123456')
      @friend = User.create(name: 'donat', email: 'donat@garcia.com', password: '123456')
    end
    it 'return false if friend_id is not provided' do
      @invite = Friendship.create(user_id: @user.id)
      expect(@invite).to_not be_valid
    end
    it 'return false if user_id is not provided' do
      @invite = Friendship.create(friend_id: @friend.id)
      expect(@invite).to_not be_valid
    end

    it 'return true if user_id and friend_id got provided' do
      @invite = Friendship.create(user_id: @user.id, friend_id: @friend.id)
      expect(@invite).to be_valid
    end
  end
end

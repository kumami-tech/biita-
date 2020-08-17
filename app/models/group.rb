class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  def show_last_message
    if (last_message = messages.first).present?
      if last_message.text?
        last_message.text
      else
        '画像が投稿されています'
      end
    else
      'メッセージがありません'
    end
  end
end
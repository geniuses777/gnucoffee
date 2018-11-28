class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation
  
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end

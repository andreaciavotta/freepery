class Reply < ApplicationRecord
belongs_to :post
belongs_to :account
validates :reply, presence: true
end

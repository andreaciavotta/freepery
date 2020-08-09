class Post < ApplicationRecord

belongs_to :account, :counter_cache => true
has_one_attached :postimage
has_many :replies, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :notifications, dependent: :destroy

validates :post, presence: true
resourcify

end


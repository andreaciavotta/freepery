class Account < ApplicationRecord
  rolify

  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_many :sended_conversations,    class_name: "Conversation", foreign_key: "sender_id", dependent: :destroy
  has_many :received_conversations,  class_name: "Conversation", foreign_key: "recipient_id", dependent: :destroy

  validates_presence_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :address
  validates_presence_of :birthday
  validates_uniqueness_of :username

  validate :validate_age
  validate :check_empty_space

  geocoded_by :address
  after_validation :geocode

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |account|
      account.email = auth.info.email
      account.password = Devise.friendly_token[0,20]
      #aggiunti i campi name, username per omniauth
      account.first_name = auth.info.first_name
      account.last_name = auth.info.last_name
      account.username = auth.info.name
      account.save!
    end
  end
  def self.new_with_session(params, session)
    super.tap do |account|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]
        ["extra"]["raw_info"]
        account.email = data["email"] if account.email.blank?
      end
    end
  end


  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", self.id, self.id)
  end

  protected

  def check_empty_space
      if self.username.match(/\s+/)
        errors.add(:username, "Non sono ammessi spazi nello username")
      end
  end

  def validate_age
      if birthday.present? && birthday > 13.years.ago.to_date
          errors.add(:birthday, 'Devi avere almeno 13 anni per poter iscriverti alla piattaforma')
      end
  end

  def delete_conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", self.id, self.id).map(&:destroy)
  end

  def self.all_except(user)
        where.not(id: user)
  end

end

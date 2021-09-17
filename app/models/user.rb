# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_create -> { self.token = generate_token }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  private

  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless User.exists?({ token: token })
    end
  end
end

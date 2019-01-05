class User < ApplicationRecord
  attr_readonly :email
  has_and_belongs_to_many :potential_houses, :class_name => :House

  before_destroy :stop_destroy, prepend: true

  has_many :messages

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data['email']).first
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def stop_destroy
    if admin
      throw :abort
    end
  end
end

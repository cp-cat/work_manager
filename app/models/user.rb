class User < ApplicationRecord
  validates :login_id, presence: true, length: { maximum: 128 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  # validates :email, presence: true #deviseのチェックで行う

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: %i[login_id]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login_id = conditions.delete(:login_id)
      where(conditions).where(['login_id = :value OR lower(email) = lower(:value)', { value: login_id }]).first
    else
      where(conditions).first
    end
  end
end

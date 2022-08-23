class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end


  attr_writer :login
  def login
   @login || self.mobile_number || self.email
  end

 def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   if (login = conditions.delete(:login))
     where(conditions.to_h).where(["lower(mobile_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
   elsif conditions.has_key?(:mobile_number) || conditions.has_key?(:email)
     where(conditions.to_h).first
   end
 end

 def self.find_for_authentication(conditions)
  login = conditions.delete(:login)
  where(conditions).where(["mobile_number = :value OR email = :value", { :value => login }]).first
end
end

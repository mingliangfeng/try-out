class Client < ActiveRecord::Base
  
  include OmniAuth::Identity::Model
  include OmniAuth::Identity::SecurePassword
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :name

  def self.auth_key=(key)
    super
    validates_uniqueness_of key, :case_sensitive => false
  end

  def self.locate(search_hash)
    where(search_hash).first
  end
end

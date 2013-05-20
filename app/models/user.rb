class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  
  validates_uniqueness_of :uid, scope: [:provider]
  
  def self.from_omniauth!(auth)
    provider = auth["provider"]
    uid = auth["uid"]
    name = auth["info"]["name"]
    
    u = find_by_provider_and_uid(provider, uid) 
    u = u || create! { |user|
      user.provider = provider
      user.uid = uid
      user.name = name
    }
    u.update_attribute(:name, name) unless u.name == name
    u
  end
    
end

class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    u = User.new()
    u.provider = auth['provider']
    u.uid = auth['uid']
    u.access_token = auth['credentials']['token']
    u.secret = auth['credentials']['secret']
    puts "*" *80
    puts auth
    puts "*" *80
    u.save
    return u
  end
end

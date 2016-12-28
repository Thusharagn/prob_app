class User < ActiveRecord::Base

def self.authenticate(data)
  @user=User.where(data)
  if @user.present?
    @user.last
  else
    nil

  end
end

end

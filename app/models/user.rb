class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  def activate_selector
    user = self
    if user.role == 'Selector'
      user.update_attribute(:approved,true)
    end
  end

  def active_for_authentication? 
  	if self.role == 'Selector'
      super && approved? 
    else
      super
    end
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  class << self
    def find_for_facebook_oauth(auth, signed_in_resource=nil)
      where(provider: auth.provider, uid: auth.uid).first ||
        where(email: auth.info.email).first ||
        create(
          name: auth.extra.raw_info.name,
          provider:auth.provider,
          uid:auth.uid,
          email:auth.info.email,
          password:Devise.friendly_token[0,20],
        )
    end
  end
end

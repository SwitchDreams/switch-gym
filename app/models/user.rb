class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: { customer: 0, teacher: 1, admin: 2 }

  self.skip_session_storage = %i[http_auth params_auth]

  def token
    token, _payload = Warden::JWTAuth::UserEncoder.new.call(self, :user, nil)
    token
  end
end

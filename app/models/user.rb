class User < ActiveRecord::Base
	has_many :questions
  has_many :answers

	validates :provider, :uid, :username, :url, presence: true

	def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_by(provider: provider, uid: uid) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create(
      provider: auth.provider,
      uid: auth.uid,
      username: auth.info.nickname,
      url: auth.info.urls["Twitter"],
    )
  end
end

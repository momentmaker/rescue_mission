class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user

	validates :title, presence: true, length: { minimum: 40,
    too_short: "must have at least %{count} characters."}
  validates :description, presence: true, length: { minimum: 150,
    too_short: "must have at least %{count} characters."}
  validates :user_id, presence: true
end

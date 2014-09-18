class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

	validates :description, presence: true, length: { minimum: 50,
    too_short: "must have at least %{count} characters."}
  validates :user_id, :question_id, presence: true
end

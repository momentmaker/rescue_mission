class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user
  #belongs_to :user, class: User, foreign_key: :user_id
  belongs_to :best_answer, class: Answer, foreign_key: :best_answer_id

	validates :title, presence: true, length: { minimum: 40,
    too_short: "must have at least %{count} characters."}
  validates :description, presence: true, length: { minimum: 150,
    too_short: "must have at least %{count} characters."}
  validates :user_id, presence: true
end

class AnswersController < ApplicationController

  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    binding.pry
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])

    if @answer.save
      redirect_to @question, notice: 'Your answer was submitted.'
    else

      render action: 'new'
    end
  end

  def destroy

  end

  def edit

  end

  def update

  end

  # GET /answers/search
  def search
    query = "%#{params[:query]}%"
    @answers = Answer
      .where('description like ?',
             query)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:description, :question_id, :user_id, :submitter)
  end
end


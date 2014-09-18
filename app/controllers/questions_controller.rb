class QuestionsController < ApplicationController

  # GET /questions
  def index
    @questions = Question.order(updated_at: :desc)
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    @best_answer = @question.best_answer
    @answers = @question.answers.order(updated_at: :desc)

    if @answers.include?(@best_answer)
      @answers = @answers - [@best_answer]
      @answers.unshift(@best_answer)
    end
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Your question has been submitted.'
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
    # @answers = Answer.find(:all)
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to @question
  end

  def best_answer
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    # @question.best_answer = @answer
    if @question.update(best_answer_id: params[:id])
      redirect_to @question
    else
      flash[:notice] = "Error!"
      render @question
    end
  end

  # GET /questions/search
  def search
    query = "%#{params[:query]}%"
    @questions = Question
      .where('title like ? or description like ?',
             query, query)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :description, :user_id, :submitter)
  end

end

class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
    @display = Question.all.sample

    current_user.questions_asked << @display unless current_user.questions_asked.include?(@display)
    @questions_asked = current_user.questions_asked.where("updated_at >= ?", session[:timestamp])

    @users = User.where(logged_in: true)
    @responses = @users.map do |user|
      user.questions_created.where("created_at >= ?", session[:timestamp]).to_a
    end.reduce([]) do |prev, current|
      prev + current
    end

  end

  def edit
    @responses = current_user.questions_created
  end

  def create
    @question = Question.new(question_params)

    if @question.content.last != '?'
      @question.content << '?'
    end

    if @question.save
      redirect_to new_question_path
    else
      render :new
    end
  end

  def bulk_update
    params['questions'].each do |id, updated_question|
      question = Question.find(id)
      question.update!(content: updated_question['content'])
    end
    redirect_to questions_url
  end

  def update
    if @question.update(question_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:content, :response_id, :creator_id).merge(creator_id: current_user.id)
    end
end

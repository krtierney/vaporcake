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
    @users = User.where(logged_in: true)
    @responses = @users.map do |user|
      user.questions_created.where("created_at >= ?", session[:timestamp]).to_a
    end.reduce([]) do |prev, current|
      prev + current
    end
    @questions = @users.map do |user|
      user.questions_asked.where("updated_at >= ?", session[:timestamp]).to_a
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

    respond_to do |format|
      if @question.save
        format.html { redirect_to new_question_path }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
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
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to user_path(current_user) }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:content, :response_id, :creator_id).merge(creator_id: current_user.id)
    end

    # def require_question_as_response
    #   # need to access params before they're passed in somehow instead?
    #   # This doesn't work as-is...
    #   @question = Question.new(question_params)
    #   unless @question.content.last == '?'
    #     @question.content << '?'
    #   end
    # end
end

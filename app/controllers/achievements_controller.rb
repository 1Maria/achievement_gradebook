class AchievementsController < ApplicationController
  before_action :check_logged_in

  def index
    @achievements = Achievement.all
  end

  def new
    if params[:type] == "Teacher"
      teacher = Teacher.find_by_email(params[:email])
      if teacher && teacher.authenticate(params[:password]) #check to make sure that teacher != nil
        session[:teacher_id] = teacher.id
        @achievement = Achievement.new
        redirect_to teachers_path
      else
        flash.now[:notice] = "Please re-enter credentials" #flash.now does not hang out after a redirect
      end
    end
  end

  def edit
  end

  def create
    @achievement = Achievement.new(achievement_params)
    respond_to do |format|
      if @achievement.save
        format.html { redirect_to @achievement, notice: 'Achievement was successfully created.' }
        format.json { render :show, status: :created, location: @achievement }
      else
        format.html { render :new }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def show
    redirect_to teachers_path
  end

  private
  def check_logged_in
    redirect_to login_login_path unless session[:teacher_id]
  end
end

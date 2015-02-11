class StudentsController < ApplicationController
  before_action :check_logged_in

  def index
    @students = Student.all
  end

  def edit_achievements
    @achievements = Achievement.all
  end

  def update_achievements
    @student.achievements = []
    params[:achievements].keys.each do |achievement_id|
      @student.achievements << Achievement.find_by_id(achievement_id)
    end
    redirect_to edit_achievements_students_path
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def check_logged_in
    redirect_to login_login_path unless session[:student_id] || session[:teacher_id]
  end

  def set_student
    @student = Student.find(params[:id])
  end


  def student_params
    params.require(:student).permit(:name, :student_email, :teacher_id, :password)
  end
end

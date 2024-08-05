class StudentsController < ApplicationController

skip_before_action :require_user, only: [:new, :create]

before_action :set_student, only: [:show,:edit,:update,:destroy]
before_action :require_same_student, only: [:edit,:update]
before_action :require_admin, only: [:destroy]



  def index
    #returns students with at least one active course
    #@students= Student.joins(:student_courses).where.not(student_courses: {student_id: nil})
    @students=Student.all
  end

  def new
    @student=Student.new
  end

  def create
    @student=Student.new(student_params)
    if @student.save
      user_mailer = UserMailer.new
      user_mailer.confirmation_email(Student.last).deliver
      flash[:notice]="You have succesfully signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def mentors
    @students= Student.where(is_mentor: true)
  end

  def update
    @student.name=params[:name]
    if @student.update(student_params)
      flash[:notice]="Update Succesfully saved"
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    if @student.destroy
      flash[:notice]="User Succesfully deleted"
      redirect_to students_path
    else
      flash[:notice]="There was an error when deleting"
      render students_path
    end
  end

  def search
    if params[:search_scope]=='false'
      @students=Student.where("name like :search OR skills like :search OR interests like :search", search: "%#{params[:search]}%")
   else
      @students=Student.where("name like :search OR skills like :search OR interests like :search", search: "%#{params[:search]}%").where(is_mentor: true)
   end
    if @students.count>0
      render 'index'
    else
      flash[:notice]="No matches found with your seach criteria"
      redirect_to students_path
    end
  end

  def confirm
    user = Student.find_by(confirmation_token: params[:token])
    if user
      user.update(confirmed: true)
      redirect_to root_url, notice: "Your account has been confirmed"
    else
      redirect_to root_url, alert: "Invalid Token"
    end
  end


  def admin_confirm
    user = Student.find(params[:id])
    if user
      user.update(confirmed: true)
      redirect_to students_path, notice: "#{user.name} has been confirmed"
    else
      redirect_to students_path, alert: "There was an error when confirming user"
    end
  end

  private

  def student_params
    params.require(:student).permit(:name,:email,:password,:password_confirmation,:is_mentor,:role,:domain,:team,:skills,:interests,:confirmed,:confirmation_token)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user!= @student && !is_admin?
      flash[:notice]="You can only edit your own profile"
      redirect_to student_path(current_user)
    end
  end

  def require_admin
    if !is_admin?
      flash[:notice]="You don't have privileges to perform this action"
      redirect_to student_path(current_user)
    end

  end



end

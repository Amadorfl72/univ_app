class StudentsController < ApplicationController

skip_before_action :require_user, only: [:new, :create]

before_action :set_student, only: [:show,:edit,:update]
before_action :require_same_student, only: [:edit,:update]
  
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
      flash[:notice]="You have succesfully signed up"
      redirect_to @student
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
    
  end

  def mentors
    @students= Student.where(is_mentor: false)
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

  def search
    @students=Student.where("name like :search OR skills like :search OR interests like :search", search: "%#{params[:search]}%")
    if @students.count>0
      render 'index'
    else
      flash[:notice]="No matches found with your seach criteria"
      redirect_to students_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:name,:email,:password,:password_confirmation,:is_mentor,:role,:domain,:team,:skills,:interests)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user!= @student
      flash[:notice]="You can only edit your own profile"
      redirect_to student_path(current_user)
    end
  end
 

end

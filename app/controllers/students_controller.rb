class StudentsController < ApplicationController
before_action :set_student, only: [:show,:edit,:update]
  def index
    @students= Student.all
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

  def update
   
    @student.name=params[:name]
    if @student.update(student_params)
      flash[:notice]="Update Succesfully saved"
      redirect_to @student
    else
      render 'edit'
    end

  end

  private

  def student_params
    params.require(:student).permit(:name,:email)
  end

  def set_student
    @student = Student.find(params[:id])
  end


 

end

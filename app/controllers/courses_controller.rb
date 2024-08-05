class CoursesController < ApplicationController

  skip_before_action :require_user
  before_action :set_course, only: [:show,:edit,:update]

  def index
    @courses=Course.all
    #@courses=Course.where('session_date > ?', DateTime.now)

  end

  def new
    @course=Course.new
  end

  def create
    @course=Course.new(course_params)
    if @course.save
      flash[:notice]="Your course was successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def search
    @courses=Course.where("short_name like :search OR name like :search OR description like :search OR keywords like :search", search: "%#{params[:search]}%")
    if @courses.count>0
      render 'index'
    else
      flash[:notice]="No matches found with your seach criteria"
      redirect_to root_path
    end
  end

  def update
    if @course.update(course_params)
      flash[:notice]="Update Succesfully saved"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show

  end


  private

  def course_params
    params.require(:course).permit(:short_name,:name,:description,:mentor_id,:keywords,:max_attendants,:session_date)
  end

  def set_course
    #puts "Entro en before action"
    @course=Course.find(params[:id])
  end


end

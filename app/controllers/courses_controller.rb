class CoursesController < ApplicationController

  skip_before_action :require_user
  before_action :set_course, only: [:show,:edit,:update]

  def index
    #@courses=Course.all
    @courses=Course.where('session_date > ?', DateTime.now)

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
    params.require(:course).permit(:short_name,:name,:description,:mentor_id,:max_attendants,:session_date)
  end

  def set_course
    @course=Course.find(params[:id])
  end


end

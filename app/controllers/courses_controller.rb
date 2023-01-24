class CoursesController < ApplicationController

  skip_before_action :require_user

  def index
    @courses=Course.all
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

  private

  def course_params
    params.require(:course).permit(:short_name,:name,:description,:mentor_id,:max_attendants,:session_date)
  end

end

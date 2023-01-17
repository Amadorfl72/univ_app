class StudentCoursesController < ApplicationController

  def create
    course_to_add=Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add[0])
      StudentCourse.create(course: course_to_add,student: current_user)
      flash[:notice]="You've been succesfully enrolled in #{course_to_add.name}"
      redirect_to current_user
    else
      redirect_to root_path
      flash[:notice]="You are already enrolled on this course "
    end

  end

  def destroy
    course_to_remove=StudentCourse.where(course: params[:course_id],student: current_user)
    #byebug
    StudentCourse.destroy(course_to_remove[0].id) 
    redirect_to root_path
  end


end

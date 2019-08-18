class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :enrolled_in_current_course, only: :show

  def show
  end

  private

  def enrolled_in_current_course
    if current_user != current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path, alert: 'Not Authorized'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end

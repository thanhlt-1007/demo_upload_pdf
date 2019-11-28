class LessonsController < ApplicationController
  before_action :load_lesson, only: %i(show edit update destroy)

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = "Create lesson success"
      redirect_to lesson_path(@lesson)
    else
      flash.now[:danger] = "Create lesson fail"
      render :new
    end
  end

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def edit
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = "Update lesson success"
      redirect_to lesson_path(@lesson)
    else
      flash.now[:danger] = "Update lesson fail"
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    flash[:success] = "Delete lesson success"
    redirect_to root_url
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :content).merge lesson_doc: lesson_doc
  end

  def lesson_doc
    params[:lesson][:lesson_doc] || File.open(params[:lesson][:lesson_doc_url])
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
    return if @lesson

    flash[:danger] = "Lesson not found"
    redirect_to root_url
  end
end

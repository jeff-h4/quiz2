class IdeasController < ApplicationController

  before_action :idea_params, only: [:create,:update]
  before_action :find_idea, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  def new 
    @idea = Idea.new
  end
  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to :root, notice: "Idea created!"
    else
      flash[:alert] = "Idea wasn't created."
      render :new
    end
  end
  def show 
    @comment = Comment.new
  end
  def index 
    @ideas  = Idea.all
    @member = Member.new
    @like   = Like.new
  end
  def edit 
  end
  def update 
  end
  def destroy
  end

  private
  def idea_params
    params.require(:idea).permit(:title,:body,:ideapic)
  end
  def find_idea
    @idea = Idea.find params[:id]
  end
end

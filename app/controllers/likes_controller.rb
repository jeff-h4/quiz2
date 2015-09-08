class LikesController < ApplicationController
  def create
    idea = Idea.find params[:idea_id]
    like = Like.new(user: current_user, idea: idea)
    if like.save
      redirect_to ideas_path(idea), notice: "Liked Idea"
    else
      redirect_to ideas_path(idea), alert: "Can't like idea"
    end
  end
  # This is to unlike
  def destroy
    like = Like.find params[:id]
    idea = like.idea
    like.destroy
    redirect_to ideas_path(idea), notice: "Unliked idea"
  end
end

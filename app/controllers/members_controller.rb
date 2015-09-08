class MembersController < ApplicationController
  def create
    idea = Idea.find params[:idea_id]
    member = Member.new(user: current_user, idea: idea)
    if member.save
      redirect_to ideas_path(idea), notice: "Joined Idea"
    else
      redirect_to ideas_path(idea), alert: "Can't join idea"
    end
  end
  # This is to unjoin
  def destroy
    member = Member.find params[:id]
    idea = member.idea
    member.destroy
    redirect_to ideas_path(idea), notice: "Unjoined idea"
  end
end

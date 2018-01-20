class PagesController < ApplicationController

  after_action :update_queue, :only => [:lineup, :update]

  def index
    @art = Art.last
  end

  def update
    @art = Art.last
    if Lineup.first.user == @current_user.username
      @art.update :data => params[:data]
    end
    user = Lineup.find_by :user => @current_user.username
    user.destroy
    redirect_to root_path
  end

  def show
    @art = Art.last
    respond_to do |format|
      format.json { render json: @art }
    end
  end

  def lineup
    Lineup.create :user => @current_user.username
  end
end

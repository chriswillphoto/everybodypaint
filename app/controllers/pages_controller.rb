class PagesController < ApplicationController

  before_action :update_queue, :only => [:index]

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
  end

  def show
    @art = Art.last
    respond_to do |format|
      format.json { render json: @art }
    end
  end

  def lineup
    Lineup.create :user => @current_user.username
    # a = Lineup.first
    # p a
    # update_queue
    # sleep 10
    # if Lineup.first == a
    #   Lineup.first.destroy
    # end
    # p 'bybeye'
  end
end

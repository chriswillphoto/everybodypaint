class PagesController < ApplicationController


  def index
    @art = Art.last

  end

  def update
    @art = Art.last
    @art.update :data => params[:data]
    user = Lineup.find_by :user => @current_user.username
    user.destroy
  end

  def show
    @art = Art.last
    respond_to do |format|
      format.json { render json: @art }
    end
  end
end

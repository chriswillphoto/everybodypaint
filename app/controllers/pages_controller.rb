class PagesController < ApplicationController

  # $users = ['one', 'two']

  def index
    @art = Art.last
    # raise 'hell'
  end

  def update
    @art = Art.last
    @art.update :data => params[:data]
  end

  def show
    @art = Art.last
    respond_to do |format|
      format.json { render json: @art }
    end
  end
end

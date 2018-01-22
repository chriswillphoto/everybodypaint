class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :fetch_user
  after_action :update_queue



    private
    def fetch_user
      @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
      session[:user_id] = nil unless @current_user.present?
    end

    def update_queue
      $lineup = Lineup.all.map(&:user).join(', ')
      $art = Art.last
      ActionCable.server.broadcast 'queue_channel',
                                   content:  $lineup,
                                   art: $art
      # QueueChannel.broadcast_to($lineup, 'yes')
    end

    # def linetimeout
    #   if Lineup.first
    #     lineupcheck = Lineup.first
    #     sleep 10
    #     secondcheck = Lineup.first
    #     if lineupcheck == secondcheck
    #       Lineup.first.destroy
    #     end
    #   end
    #   update_queue
    # end
end

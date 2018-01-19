class QueueChannel < ApplicationCable::Channel
  def subscribed
    stream_from "queue_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

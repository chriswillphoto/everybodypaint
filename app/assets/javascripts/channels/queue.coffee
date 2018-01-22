App.queue = App.cable.subscriptions.create "QueueChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#queue').text(data.content)
    $('.container').html(data.art.data.trim())
    # console.log(data)
    # $('.queue').text(data.content.map( (i) => return i))
    # $('.queue').attr('data-qu', JSON.stringify(data.content))

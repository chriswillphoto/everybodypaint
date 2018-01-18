let color = "black";

$(document).ready(function() {
  let fragment = document.createDocumentFragment()

  // $.ajax({
  //   url:'http://localhost:3000/current.json'
  // }).done(function(res){
  //   $('.container').html(res.data)
  // })


  // for (var i = 0; i < 10000; i++) {
  //   $("<div />").appendTo(fragment)
  // }
  // $('.container').append(fragment)

  $('.container').on('click', 'div', function() {
    $(this).removeClass().addClass(color)
    $.ajax({
      url: 'http://localhost:3000/',
      data: {'data': $(".container").html()},
      method: 'PUT'
    })
  })

  $('.palette div').on('click', function() {
    $('.selected').removeClass('selected')
    $(this).addClass('selected')
    color = $(this).attr('class').split(" ")[0]
  })

})

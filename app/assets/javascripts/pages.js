let color = "black";
let line = ''
let currentuser;
let signinshow = false
let signupshow = false

$(document).ready(function() {
  let fragment = document.createDocumentFragment()

  $(".addtolineup").on('click', function() {
    $.ajax({url: '/lineup'})
  })

$(".login div h4").on('click', function() {
  if( $(this).siblings('form').css('display') === "none" ) {
    $(this).siblings().css('display', 'inline-block')
  }else{
    $(this).siblings().css('display', 'none')
  }
})

  var targetNode = document.getElementById('queue');

  // Options for the observer (which mutations to observe)
  var config = { attributes: true, childList: true };

  // Callback function to execute when mutations are observed
  var callback = function(mutationsList) {
      for(var mutation of mutationsList) {
          if (mutation.type == 'childList') {
              console.log('A child node has been added or removed.');
              console.log(mutation.target.innerText)
              line = mutation.target.innerText
          }
          else if (mutation.type == 'attributes') {
              console.log('The ' + mutation.attributeName + ' attribute was modified.');
          }
      }
  };

  // Create an observer instance linked to the callback function
  var observer = new MutationObserver(callback);

  // Start observing the target node for configured mutations
  observer.observe(targetNode, config);

  $.ajax({
    url:'/current.json'
  }).done(function(res){
    $('.container').html(res.data)
  })

  // if(currentuser === line.split(', ')[0]){
  //   console.log('yes')
  // }

  // for (var i = 0; i < 10000; i++) {
  //   $("<div />").appendTo(fragment)
  // }
  // $('.container').append(fragment)

  $('.container').on('click', 'div', function() {
    if(currentuser === $('#queue').text().trim().split(', ')[0]) {
      $(this).removeClass().addClass(color)
      $.ajax({
        url: '/',
        data: {'data': $(".container").html()},
        method: 'PUT'
      }).done(function() {
        window.location.reload()
      })
    }
  })

  $('.palette div').on('click', function() {
    $('.selected').removeClass('selected')
    $(this).addClass('selected')
    color = $(this).attr('class').split(" ")[0]
  })

})

growl = (params) ->

  k$.buffer ->
    defaults =
      title: undefined
      text: undefined
      delay: 2000
      type: 'alert-warn'
      id: Date.now()

    params = k$.extend defaults, params

    # Create growl container
    if not k$.$$('.growl_container').length
      growlContainer = document.createElement 'div'
      growlContainer.className = 'growl_container'
      document.body.appendChild growlContainer

    # Create growl
    growl = document.createElement 'div'

    # Add appropriate classes
    className = "alert growl #{params.type} growl-#{params.id}"
    growl.className = className

    # Add content
    content = ""
    content += "<h1>#{params.title}</h1>" if params.title
    content += "<p>#{params.text}</p>" if params.text
    growl.innerHTML = content

    # Append child to container
    k$.$('.growl_container').appendChild growl

    delay = params.delay
    id = params.id

    if delay > 0
      do (delay, id) ->
        setTimeout ->
          k$.$(".growl-#{id}").style.display = "none"
        , delay

k$.growl = growl

module.exports = growl

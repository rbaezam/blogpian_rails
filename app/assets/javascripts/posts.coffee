# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $.ajax
    url: '/posts'
    dataType: 'json'
    success: (data) ->
      $.each data, (index, post) ->
        body = post.body
        if post.body.length > 300
          body = post.body.substring(0, 300)
          body = body + '...'
        title = '<h4>' + post.title + '</h4>'
        link = '<a href="/posts/' + post._id.$oid + '">' + title + '</a>'
        publishedAtText = '<small>' + new Date(post.created_at) + '</small>'
        bodyText = '<p>' + body + '</p>'
        li = '<li>' + link + publishedAtText + bodyText + '</li>'
        $('#posts').append li
        return
      return

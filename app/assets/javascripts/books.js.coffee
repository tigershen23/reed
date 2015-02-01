# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initBooksJS = ->
  newBookFormValidations()

newBookFormValidations = ->
  $("#new_book")
    .bootstrapValidator
      icon:
        valid: "glyphicon glyphicon-ok"
        invalid: "glyphicon glyphicon-remove"
        validating: "glyphicon glyphicon-refresh"

      fields:
        "book[title]":
          validators:
            notEmpty:
              message: "Please enter a title"

        "book[author]":
          validators:
            notEmpty:
              message: "Please enter an author name"

        "book[description]":
          validators:
            notEmpty:
              message: "Please enter a description"

        "book[amazon_id]":
          validators:
            notEmpty:
              message: "Please enter an Amazon ID"
    .on "success.form.bv", (e) ->
      # Called when the form is valid
      $form = $(e.target)
      e.preventDefault()  if $form.data("remote") and $.rails isnt `undefined`
      return

$(document).on("ready page:load", initBooksJS)

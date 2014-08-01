Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

EditContactView = require '../views/edit/contact_view'
MissingContactView = require '../views/show/missing_contact_view'
LoadingView = require '../views/common/loading_view'

module.exports = (id) ->
  loadingView = new LoadingView()
  @options.mainRegion.show loadingView

  fetchingContact = Radio.reqres.request 'global', "contact:entity", id
  Backbone.history.navigate "contacts/#{id}/edit"

  $.when(fetchingContact).done (contact) =>
    editContactView = new EditContactView
      model: contact
      generateTitle: true

    editContactView.on 'form:submit', (data) =>
      savingContact = contact.save data
      if savingContact
        $.when(savingContact).done =>
          @showContact contact.get('id')
        .fail (response) ->
          if response.status is 422
            editContactView.triggerMethod "form:data:invalid", response.responseJSON.errors
          else
            console.log 'an unprocessed error, try again.'
      else
        editContactView.triggerMethod "form:data:invalid", contact.validationError

    @options.mainRegion.show(editContactView)

  .fail (response) =>
    if response.status is 404
      editContactView = new MissingContactView()
      @options.mainRegion.show(editContactView)
    else
      console.log 'unprocessed error'

  Radio.commands.execute "global", "set:active:header", "contacts"

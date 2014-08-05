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
      if contact is undefined
        editContactView = new MissingContactView()
      else
        editContactView = new EditContactView
          model: contact
          generateTitle: true

      @options.mainRegion.show(editContactView)
      Radio.commands.execute "global", "set:active:header", "contacts"

      editContactView.on 'form:submit', (data) =>
        if contact.save data
          @showContact contact.get('id')
        else
          editContactView.triggerMethod "form:data:invalid", contact.validationError

Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

ShowContactView = require '../views/show/contact_view'
MissingContactView = require '../views/show/missing_contact_view'
LoadingView = require '../views/common/loading_view'

module.exports = (id) ->
    loadingView = new LoadingView()
    @options.mainRegion.show loadingView

    fetchingContact = Radio.reqres.request 'global', "contact:entity", id
    Backbone.history.navigate "contacts/#{id}"

    $.when(fetchingContact).done (contact) =>
      if contact is 'undefined'
        showContactView = new MissingContactView()
      else
        showContactView = new ShowContactView model: contact

      @options.mainRegion.show(showContactView)
      Radio.commands.execute "global", "set:active:header", "contacts"

      showContactView.on 'childview:contact:edit', (childview, model) =>
        @editContact(model.get('id'))

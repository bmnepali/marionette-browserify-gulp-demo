Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

ShowContactView = require '../views/show/contact_view'
MissingContactView = require '../views/show/missing_contact_view'
LoadingView = require '../views/common/loading_view'

module.exports = (id) ->
  loadingView = new LoadingView()
  @options.mainRegion.show loadingView

  fetchingContact = Radio.reqres.request 'global', "contact:entity", id,
    error: (xhr, responseText, error) ->
      console.log 'some error happend (processed in error callback)'

  Backbone.history.navigate "contacts/#{id}"

  $.when(fetchingContact).done (contact) =>
    showContactView = new ShowContactView model: contact

    showContactView.on 'childview:contact:edit', (childview, model) =>
      @editContact(model.get('id'))

    @options.mainRegion.show(showContactView)
  .fail (response) =>
    console.log 'some error happened (processed in deferred fail callback)'
    if response.status is 404
      showContactView = new MissingContactView()
      @options.mainRegion.show(showContactView)
    else
      console.log 'an unprocessed error, try again.'

  Radio.commands.execute "global", "set:active:header", "contacts"


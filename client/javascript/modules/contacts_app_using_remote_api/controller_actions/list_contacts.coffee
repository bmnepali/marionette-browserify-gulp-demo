Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

ListContactsView = require '../views/list/contacts_view'
ListLayoutView = require '../views/list/layout_view'
ListPanelView = require '../views/list/panel_view'
NewContactView = require '../views/new/new_view'
MissingContactView = require '../views/show/missing_contact_view'
LoadingView = require '../views/common/loading_view'
PaginatedView = require '../../../common/views/paginated_view'
FilterBoxView = require '../views/list/filter_box_view'

ContactModel = require '../models/contact'

module.exports = (criterion) ->
  loadingView = new LoadingView()
  @options.mainRegion.show loadingView

  fetchingContacts = Radio.reqres.request 'global', "contact:entities"
  Backbone.history.navigate "contacts"

  layoutView = new ListLayoutView()
  panelView = new ListPanelView()

  $.when(fetchingContacts).done (contacts) =>
    contacts.getPage(1)

    listContactsView = ListContactsView collection: contacts

    filterBoxView = FilterBoxView
      collection: contacts
      fields: [
        'firstName'
        'lastName'
      ]

    listContactsView = new PaginatedView
      collection: contacts
      mainView: listContactsView
      filterView: filterBoxView

    panelView.on 'contact:new', =>
      newContact = new ContactModel()

      newContactView = new NewContactView
        model: newContact

      newContactView.on 'form:submit', (data) ->
        savingContact = newContact.save data
        if savingContact
          $.when(savingContact).done ->
            contacts.add(newContact)
            newContactView.trigger 'dialog:close'
            # newContactView = listContactsView.children.findByModel(newContact)
            newContactView = listContactsView.collection.models.filter (model) ->
              model.get 'id' is newContact.attributes.id
          .fail (response) ->
            newContactView.onClose = ->
              newContact.set(newContact.previousAttributes())
            if response.status is 422
              newContactView.triggerMethod 'form:data:invalid', response.responseJSON.errors
            else
              console.log 'unprocessed error, try again'
         else
           newContactView.triggerMethod 'form:data:invalid', newContact.validationError

      @options.dialogRegion.show(newContactView)

    layoutView.on 'show', ->
      @panelRegion.show panelView
      @contactsRegion.show listContactsView

    @options.mainRegion.show(layoutView)
  .fail ->
    console.log 'unprocessed error'

  Radio.commands.execute "global", "set:active:header", "contacts"

Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

ListContactsView = require '../views/list/contacts_view'
ListLayoutView = require '../views/list/layout_view'
ListPanelView = require '../views/list/panel_view'
NewContactView = require '../views/new/new_view'
EditContactView = require '../views/edit/contact_view'
MissingContactView = require '../views/show/missing_contact_view'
LoadingView = require '../views/common/loading_view'

ContactModel = require '../models/contact'
FilteredCollection = require '../../../common/filtered_collections'

module.exports = (criterion) ->
  loadingView = new LoadingView()
  @options.mainRegion.show loadingView

  fetchingContacts = Radio.reqres.request 'global', "contact:entities"
  Backbone.history.navigate "contacts"

  layoutView = new ListLayoutView()
  panelView = new ListPanelView()

  $.when(fetchingContacts).done (contacts) =>
    filteredContacts = FilteredCollection
      collection: contacts
      filterFunction: (filterCriterion) ->
        criterion = filterCriterion.toLowerCase()
        (contact) ->
          if contact.get('firstName').toLowerCase().indexOf(criterion) isnt
          -1 or contact.get('lastName').toLowerCase().indexOf(criterion) isnt
          -1 or contact.get('phoneNumber').toLowerCase().indexOf(criterion) isnt -1
            contact

    if criterion
      filteredContacts.filter(criterion)
      panelView.once('show', ->
        panelView.triggerMethod "set:filter:criterion", criterion
      )

    listContactsView = new ListContactsView collection: filteredContacts

    panelView.on 'contacts:filter', (filterCriterion) ->
      filteredContacts.filter(filterCriterion)
      Radio.vent.trigger 'global', 'contacts:filter', filterCriterion

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
            newContactView = listContactsView.children.findByModel(newContact)
            if newContactView
              newContactView.flash('success')
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

    listContactsView.on 'childview:contact:delete', (childView, args) ->
      args.model.destroy()

    listContactsView.on 'childview:contact:show', (childView, args) =>
      @showContact(args.model.get('id'))

    listContactsView.on 'childview:contact:edit', (childView, args) =>
      model = args.model
      view = new EditContactView
        model: model

      view.on "form:submit", (data) ->
        model.set data, silent: true
        savingContact = model.save data, wait: true
        if savingContact
          view.onBeforeClose = ->
            model.set changedOnServer: false

          $.when(savingContact).done ->
            childView.render()
            delete view.onClose
            view.trigger 'dialog:close'
            childView.flash "success"
          .fail (response) ->
            if response.status is 422
              view.onClose = ->
                model.set(response.responseJSON.entity)

              keys = ['firstName', 'lastName', 'phoneNumber']
              model.refresh response.responseJSON.entity, keys

              view.render()
              newContactView.triggerMethod 'form:data:invalid', response.responseJSON.errors
              model.set response.responseJSON.entity, silent: true
            else
              console.log 'unprocessed error, try again'
        else
          view.onClose = ->
            model.set(model.previousAttributes())
          view.triggerMethod 'form:data:invalid', model.validationError

      @options.dialogRegion.show(view)

    @options.mainRegion.show(layoutView)
  .fail ->
    console.log 'unprocessed error'

  Radio.commands.execute "global", "set:active:header", "contacts"

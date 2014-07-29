Marionette = require 'backbone.marionette'
Radio = require '../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

ListContactsView = require './views/list/contacts_view'
ShowContactView = require './views/show/contact_view'
EditContactView = require './views/edit/contact_view'
ListLayoutView = require './views/list/layout_view'
ListPanelView = require './views/list/panel_view'
NewContactView = require './views/new/new_view'
MissingContactView = require './views/show/missing_contact_view'
LoadingView = require './views/common/loading_view'

ContactEntity = require './entities/contact'
ContactModel = require './models/contact'
FilteredCollection = require '../../common/filtered_collections'

module.exports = Marionette.Controller.extend
  initialize: ->
    ContactEntity.initialize()
    @setHandlers()

  editContact: (id) ->
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

  showContact: (id) ->
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

  listContacts: (criterion) ->
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

        @options.dialogRegion.show(newContactView)

        newContactView.on 'form:submit', (data) =>
          if contacts.length > 0
            highestId = contacts.max( (c) -> c.id ).get('id')
            data.id = highestId + 1
          else
            data.id = 1
          if newContact.save data
            contacts.add(newContact)
            newContactView.trigger 'dialog:close'
            newContactView = listContactsView.children.findByModel(newContact)
            if newContactView
              newContactView.flash('success')
          else
            newContactView.triggerMethod 'form:data:invalid', newContact.validationError

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

        view.on "form:submit", (data) =>
          if model.save(data)
            childView.render()
            view.trigger 'dialog:close'
            childView.flash "success"
          else
            view.triggerMethod "form:data:invalid", model.validationError

        @options.dialogRegion.show(view)

      @options.mainRegion.show(layoutView)
      Radio.commands.execute "global", "set:active:header", "contacts"

  setHandlers: ->
    Radio.vent.on 'global', 'contacts:list', =>
      Backbone.history.navigate 'contacts'
      @listContacts()

    Radio.vent.on 'global', 'contacts:filter', (criterion) ->
      if criterion
        Backbone.history.navigate 'contacts/filter/criterion:' + criterion
      else
        Backbone.history.navigate 'contacts'

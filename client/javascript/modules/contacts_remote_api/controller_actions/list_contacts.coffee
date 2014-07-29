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

        @options.dialogRegion.show(newContactView)

        newContactView.on 'form:submit', (data) ->
          contactSaved = newContact.save data,
            success: ->
              contacts.add(newContact)
              newContactView.trigger 'dialog:close'
              newContactView = listContactsView.children.findByModel(newContact)
              if newContactView
                newContactView.flash('success')
            if not contactSaved
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

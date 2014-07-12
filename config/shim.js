module.exports = {
    "jquery": "$",
    "spin":"spin",
    "underscore": "_",
    "backbone": {
        "exports": "Backbone",
        "depends": {
           "jquery":"$",
           "underscore":"_"
        }
    },
    "jquery.spin": {
        "depends": {
           "spin":"spin",
        }
    },
    "jqueryui": {
        "depends": {
           "jquery":"$",
        }
    },
    "backbone.localstorage": {
        "exports": "Backbone.LocalStorage",
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.picky": {
        "exports": "Backbone.Picky",
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.syphon": {
        "exports": "Backbone.Syphon",
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.babysitter": {
        "exports": "Backbone.BabySitter",
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.wreqr": {
        "exports": "Backbone.Wreqr",
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.marionette": {
        "exports": "Marionette",
        "depends": {
            "backbone":"Backbone",
            "backbone.wreqr":"Backbone.Wreqr",
            "backbone.babysitter":"Backbone.BabySitter"
        }
    }
};

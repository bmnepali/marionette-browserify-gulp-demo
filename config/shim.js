module.exports = {
    "jquery": "$",
    "jquery": "jQuery",
    "spin":"spin",
    "lodash": "_",
    "backbone": {
        "exports": "Backbone",
        "depends": {
           "jquery":"$",
           "lodash":"_"
        }
    },
    "jquery.spin": {
        "exports": "$.fn.spin",
        "depends": {
           "jquery":"$",
           "spin":"spin"
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
    "backbone-validation": {
        "exports": "Backbone.Validation",
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

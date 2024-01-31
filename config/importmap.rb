# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true

pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3
pin "jquery" # @3.7.1

pin_all_from "app/javascript/commons", under: "commons"
pin_all_from "app/javascript/controllers", under: "controllers"

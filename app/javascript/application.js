// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
// Turbo.session.drive = false

import "controllers"

import Rails from '@rails/ujs'

import "popper"
import "bootstrap"
import jquery from 'jquery'
window.$ = jquery;
window.jQuery = jquery;

import "controllers"

import timeago from "commons/timeago"

Rails.start();

document.addEventListener('turbo:load', () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  timeago.init();
});

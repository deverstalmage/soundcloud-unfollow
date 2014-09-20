require 'jquery'
require 'angular/angular'
require 'angular-resource/angular-resource'
require 'angular-route/angular-route'

require './main/main-controller'

require './templates'

require './components/soundcloud/soundcloud-service'


angular
  .module 'sc-unfollow-guide', [
    'ngRoute'
    'ngResource'
    'sc-unfollow-guide.main'
    'sc-unfollow-guide.services.soundcloud'
    'sc-unfollow-guide.templates'
  ]
  .constant 'config', {
    clientId: 'b7ce309058b352437aacb5e1fd78727a'
  }
  .run (Soundcloud, config) ->
    Soundcloud.initialize
      client_id: config.clientId
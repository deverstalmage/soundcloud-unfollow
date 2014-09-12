require 'jquery'
require 'angular/angular'
require 'angular/angular-resource'

require './main/main-controller'

require './templates'

require './components/soundcloud/soundcloud-service'


angular.module 'sc-unfollow-guide', [
  'ngRoute'
  'ngResource'
  'sc-unfollow-guide.main'
  'sc-unfollow-guide.services.soundcloud'
  'sc-unfollow-guide.templates'
]
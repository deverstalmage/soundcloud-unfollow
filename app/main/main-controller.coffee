MainCtrl = ->
  this.hello = 'hey homes'

Config = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'main/main.html'
      controller: 'MainCtrl'
      controllerAs: 'main'

angular.module 'sc-unfollow-guide.main', []
  .config Config
  .controller 'MainCtrl', MainCtrl
angular.module 'sc-unfollow-guide.main', []
  .config [
    '$routeProvider'
    ($routeProvider) ->
      $routeProvider
        .when '/'
          templateUrl: 'main/main.html'
          controller: 'MainCtrl'
  ]
  .controller 'MainCtrl', [
    '$scope'
    ($scope) ->
      $scope.hello = 'watup'
  ]
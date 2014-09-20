async = require 'async'

MainCtrl = ($scope, Soundcloud) ->
  $scope.hello = 'hey homes'
  $scope.tracks = []

  setit = (t) ->
    $scope.tracks = t

  doit = ->
    console.log $scope.hello

  Soundcloud.get '/users/897969/followings', (followings) ->
    async.each followings, (following, callback) ->
      Soundcloud.get '/users/' + following.id + '/tracks', (tracks) ->
        console.log $scope.hello
        # $scope.hello = tracks[0].title
        # setit tracks[0].title
        $scope.tracks.push tracks[0]
        callback()
    , (err) ->
      console.log 'done'
      # console.log $scope.tracks



Config = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'main/main.html'
      controller: 'MainCtrl'

angular
  .module 'sc-unfollow-guide.main', []
  .config Config
  .controller 'MainCtrl', MainCtrl
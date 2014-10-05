async = require 'async'
_ = require 'lodash'
$ = require 'jquery'

MainCtrl = ($http, $q, $scope, Soundcloud) ->

  userID = 897969

  $scope.artists = []

  getFollowings = (userId) ->
    deferred = $q.defer()
    Soundcloud.get '/users/' + userId + '/followings',
      limit: 200
    , (followings) ->
      deferred.resolve followings
    return deferred.promise

  getLatestPostDate = (permalink) ->
    deferred = $q.defer()
    $http.get 'http://127.0.0.1:9002/latest/'  + permalink
      .success (data, status, headers, config) ->
        date = new Date data.last
        deferred.resolve date
    return deferred.promise
    # Soundcloud.get '/users/' + following.id + '/tracks', (tracks) ->
    #   deferred.resolve tracks

  timeSince = (date) ->
    seconds = Math.floor((new Date() - date) / 1000)
    interval = Math.floor(seconds / 31536000)
    return interval + ' years'  if interval > 1
    interval = Math.floor(seconds / 2592000)
    return interval + ' months'  if interval > 1
    interval = Math.floor(seconds / 86400)
    return interval + ' days'  if interval > 1
    interval = Math.floor(seconds / 3600)
    return interval + ' hours'  if interval > 1
    interval = Math.floor(seconds / 60)
    return interval + ' minutes'  if interval > 1
    return Math.floor(seconds) + ' seconds'

  getFollowings userID
    .then (followings) ->
      followings.forEach (following, index, arr) ->
        if following.permalink
          artist =
            name: following.username
            url: following.permalink_url
          $q.when getLatestPostDate following.permalink
            .then (date) ->
              artist.posted = timeSince date
              $scope.artists.push artist
              # console.log 'last posted ' + timeSince(date) + ' ago' if date


Config = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'main/main.html'
      controller: 'MainCtrl'

angular
  .module 'sc-unfollow-guide.main', []
  .config Config
  .controller 'MainCtrl', MainCtrl
spyro = angular.module "spyro"

# Thanks to http://blog.akquinet.de/2014/02/26/interactive-svg-with-angularjs-part-2/ for svgControl and svgHandle

spyro.directive "svgControl", ->
  return {
    restrict: "E",
    replace: true,
    transclude: true,
    template: "<div><object type='image/svg+xml' class='ng-hide' height='100%' width='100%'></object><div ng-transclude></div></div>",
    link: (scope, element, attrs, ctrl) ->
      obj = element.children().eq(0)
      obj.on("load", -> ctrl.ready obj)
      obj.attr("data",attrs.href)
      obj.removeClass("ng-hide")
      obj.onselectstart = -> return false
    controller: ($scope) ->
      svg = null
      deferred = []
      this.init = (fn) ->
        if svg
          fn($scope)
        else
          deferred.push(fn)
      this.resolve = (href) ->
        id = href.replace("#", "")
        dom = svg.getElementById(id)
        return angular.element(dom) if dom
        return null
      this.rawresolve = (href) ->
        id = href.replace("#", "")
        dom = svg.getElementById(id)
        return dom if dom
        return null
      this.ready = (obj) ->
        svg = obj[0].getSVGDocument()
        svg.onselectstart = -> return false
        for fn in deferred
          fn($scope)
      this
    }

spyro.directive "svgHandle", ($parse) ->
  return {
    restrict: "E",
    require: "^svgControl",
    link: (scope, element, attrs, ctrl) ->
      fn = $parse(attrs.click)
      ctrl.init (parentScope) ->
        ctrl.resolve(attrs.href).on("click", (event) ->
          event.preventDefault()
          parentScope.$apply ->
            fn(parentScope, {$event:event})
        )
  }

spyro.directive "svgBind", ($compile, $parse) ->
  return {
    restrict: "E",
    require: "^svgControl",
    link: (scope, element, attrs, ctrl) ->
      ctrl.init (parentScope) ->
          e = ctrl.rawresolve(attrs.href)
          e.textContent = parentScope[attrs.value]
          $compile(angular.element(e))(parentScope)

          value_func = (innerscope) ->
            innerscope[attrs.value]
          listener_func = (newvalue, oldvalue) ->
              e.textContent = newvalue
              $compile(angular.element(e))(parentScope)
          
          parentScope.$watch value_func, listener_func
  }

spyro.controller "MainController", ($scope) ->
  i = 0
  $scope.belch = ->
    $scope.change_text = "BURP#{i}"
    i = i + 1
  $scope.change_text = "I'm a changed ... text"
  this

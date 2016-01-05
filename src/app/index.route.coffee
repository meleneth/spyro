angular.module "spyro"
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "home",
        url: "/"
        templateUrl: "app/wizard/wizard.html"
        controller: "WizardController"
        controllerAs: "wizard"
      .state "namespaces",
        url: "/namespaces"
        templateUrl: "app/wizard/namespaces.html"
        controller: "WizardController"
        controllerAs: "wizard"
      .state "class",
        url: "/namespace/:namespace/class/:class"
        templateUrl: "app/wizard/class.html"
        controller: "ClassController"
        controllerAs: "wizard"
      .state "namespace",
        url: "/namespace/:namespace"
        templateUrl: "app/wizard/namespace.html"
        controller: "NamespaceController"
        controllerAs: "wizard"

    $urlRouterProvider.otherwise '/'

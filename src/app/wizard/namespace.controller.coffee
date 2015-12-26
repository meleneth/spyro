angular.module "spyro"
  .controller "NamespaceController", (ProjectService, $stateParams) ->
    vm = this

    vm.types = ProjectService.types[$stateParams.namespace]

    vm.namespace = ProjectService.namespace $stateParams.namespace

    return

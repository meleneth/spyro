angular.module "spyro"
  .controller "NamespaceController", (ProjectService, $stateParams) ->
    vm = this

    vm.types = ProjectService.types[$stateParams.namespace]
    vm.classes = ProjectService.classes[$stateParams.namespace]

    vm.namespace = ProjectService.register_namespace $stateParams.namespace

    vm.make_new_class = ->
      vm.new_class = {name: ''}

    vm.save_new_class = ->
      ProjectService.register_class vm.namespace.name, vm.new_class.name
      vm.classes = ProjectService.classes[vm.namespace.name]
      vm.new_class = false

    return

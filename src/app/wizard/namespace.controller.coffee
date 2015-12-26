angular.module "spyro"
  .controller "NamespaceController", (ProjectService, $stateParams) ->
    vm = this

    vm.namespace = ProjectService.register_namespace $stateParams.namespace

    vm.types = vm.namespace.types
    vm.classes = vm.namespace.classes

    vm.make_new_class = ->
      vm.new_class = {name: ''}

    vm.save_new_class = ->
      ProjectService.register_class vm.namespace.name, vm.new_class.name
      vm.classes = vm.namespace.classes
      vm.new_class = false

    return

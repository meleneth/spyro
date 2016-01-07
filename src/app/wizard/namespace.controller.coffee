angular.module "spyro"
  .controller "NamespaceController", (Project, $stateParams) ->
    vm = this

    vm.namespace = Project.register_namespace $stateParams.namespace

    vm.types = vm.namespace.types
    vm.classes = vm.namespace.classes

    vm.make_new_class = ->
      vm.new_class = {name: ''}

    vm.save_new_class = ->
      Project.register_class vm.namespace.name, vm.new_class.name
      vm.classes = vm.namespace.classes
      vm.new_class = false

    return

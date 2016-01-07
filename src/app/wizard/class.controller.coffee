angular.module "spyro"
  .controller "ClassController", (Project, $stateParams) ->
    vm = this

    vm.namespace = Project.register_namespace $stateParams.namespace
    vm.class = Project.find_class vm.namespace.name, $stateParams.class

    vm.types = Project.types[$stateParams.namespace]
    vm.classes = Project.classes[$stateParams.namespace]

    vm.make_new_class = ->
      vm.new_class = {name: ''}

    vm.save_new_class = ->
      Project.register_class vm.namespace.name, vm.new_class.name
      vm.classes = Project.classes[vm.namespace.name]
      vm.new_class = false

    return

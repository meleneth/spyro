angular.module "spyro"
  .controller "ClassController", (Project, $stateParams) ->
    vm = this

    vm.namespace = Project.register_namespace $stateParams.namespace
    vm.class = Project.find_class vm.namespace.name, $stateParams.class

    vm.types = vm.class.members
    vm.methods = vm.class.methods

    vm.make_new_method = ->
      vm.new_method = {name: ''}

    vm.save_new_method = ->
      alert("ya caught me")

    return

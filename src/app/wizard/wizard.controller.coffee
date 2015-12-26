angular.module "spyro"
  .controller "WizardController", (ProjectService) ->
    vm = this
    vm.ps = ProjectService
    vm.namespaces = ProjectService.namespaces
    vm.types = ProjectService.types
    vm.wizard_name = "Gandalf"

    vm.make_new_namespace = ->
      vm.new_namespace = {name: ""}

    vm.save_new_namespace = ->
      ProjectService.register_namespace vm.new_namespace.name
      vm.new_namespace = false
      
    return


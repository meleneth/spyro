angular.module "spyro"
  .controller "WizardController", (ProjectService) ->
    vm = this
    vm.namespaces = ProjectService.namespaces
    vm.wizard_name = "Gandalf"

    vm.add_namespace = ->
      vm.namespaces.push {name: "namespace"}

    return


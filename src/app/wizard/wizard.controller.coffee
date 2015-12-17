angular.module "spyro"
  .controller "WizardController", ->
    vm = this
    vm.namespaces = []
    vm.wizard_name = "Gandalf"

    vm.add_namespace = ->
      vm.namespaces.push {name: "namespace"}

    return


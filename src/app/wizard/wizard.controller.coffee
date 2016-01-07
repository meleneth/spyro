angular.module "spyro"
  .controller "WizardController", (Project) ->
    vm = this
    vm.ps = Project
    vm.namespaces = Project.namespaces
    vm.types = Project.types
    vm.wizard_name = "Gandalf"

    vm.make_new_namespace = ->
      vm.new_namespace = {name: ""}

    vm.save_new_namespace = ->
      Project.register_namespace vm.new_namespace.name
      vm.new_namespace = false
      
    return


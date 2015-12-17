describe 'controllers', ->
  beforeEach module 'spyro'

  it 'should know the wizards name', inject ($controller) ->
    vm = $controller('WizardController')

    expect(vm.wizard_name).toEqual("Gandalf")



describe 'project service', ->
  beforeEach module 'spyro'

  it "creates default data", (ProjectService) ->
    project = ProjectService()

    expect(project.name).toEqual("")
    expect(project.language).toEqual("c++")

  describe "register_namespace", ->
    it "creates entries for types and classes", (ProjectService) ->
      project = ProjectService()

      project.register_namespace("Wyld")
      expect(project.types["Wyld"]).toEqual([])
      expect(project.classes["Wyld"]).toEqual([])





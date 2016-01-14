describe 'project service', ->
  beforeEach module 'spyro'

  it "creates default data", inject (Project) ->
    expect(Project.name).toEqual("")
    expect(Project.language).toEqual("c++")

  describe "register_namespace", ->
    it "creates and returns a new namespace", inject (Project) ->
      expect(Project.find_namespace("Wyld")).toBeFalsy()
      Project.register_namespace("Wyld")
      expect(Project.find_namespace("Wyld")).toBeTruthy()

  describe "register_class", ->
    it "creates and returns a class", inject (Project) ->
      expect(Project.find_namespace("Wyld")).toBeFalsy()
      Project.register_class("Wyld", "Chyld")
      expect(Project.find_class("Wyld", "Chyld")).toBeTruthy()

  describe "resolve", ->
    it "returns false if nothing found", inject (Project) ->
      expect(Project.resolve("Wyld::Bogus")).toBeFalsy()

    it "finds a class in a namespace", inject (Project) ->
      Project.register_class("Wyld", "Chyld")
      expect(Project.resolve("Wyld::Chyld")).toBeTruthy()

    it "finds a type in a namespace", inject (Project) ->
      Project.register_type("Wyld", "Chyld")
      expect(Project.resolve("Wyld::Chyld")).toBeTruthy()


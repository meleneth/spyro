angular.module "spyro"
  .service "ProjectService", ->
    project = {name: '', language: 'c++', namespaces: [], types: {}, classes: {}}

    project.register_namespace = (name) ->
      namespace = _.find project.namespaces, (n) -> n.name == name
      return namespace if namespace
      new_namespace = {name: name}
      project.namespaces.push new_namespace
      project.types[name] = []
      project.classes[name] = []
      return new_namespace

    project.register_type = (namespace_name, name, size) ->
      new_type = {namespace: namespace_name, name: name, size: size}
      namespace = project.register_namespace namespace_name
      project.types[namespace.name].push new_type
      return new_type

    project.register_class = (namespace_name, name) ->
      new_class = {namespace: namespace_name, name: name}
      namespace = project.register_namespace namespace_name
      project.classes[namespace.name].push new_class
      return new_class

    project.find_namespace = (name) ->
      return _.find project.namespaces, (n) -> n.name == name

    project.find_type = (namespace_name, name) ->
      return _.find project.types, (t) -> t.namespace == namespace_name and t.name == name

    project.find_class = (namespace_name, name) ->
      return _.find project.classes, (t) -> t.namespace == namespace_name and t.name == name

    project.to_json = ->
      pickle = {name: project.name, language: project.language, namespaces: project.namespaces, types: project.types, classes: project.classes}
      return JSON.stringify pickle, null, 2

    project.register_type 'std', '*', 8
    project.register_type 'std', 'char', 1
    project.register_type 'std', 'uint32_t', 4
    project.register_type 'std', 'int32_t', 4
    project.register_type 'std', 'uint64_t', 8
    project.register_type 'std', 'int64_t', 8

    return project


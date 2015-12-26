angular.module "spyro"
  .service "ProjectService", ->
    project = {name: '', language: 'c++', namespaces: [], types: {}, classes: {}}

    project.register_namespace = (name) ->
      namespace = _.find project.namespaces, (n) -> n.name == name
      return namespace if namespace
      new_namespace = {name: name, types: [], classes: []}
      project.namespaces.push new_namespace
      return new_namespace

    project.register_type = (namespace_name, name, size) ->
      namespace = project.register_namespace namespace_name
      type = _.find namespace.types, (n) -> n.name == name
      return type if type
      new_type = {name: name, size: size, alias: false}
      namespace.types.push new_type
      return new_type

    project.register_class = (namespace_name, name) ->
      namespace = project.register_namespace namespace_name
      klass = _.find namespace.classes, (c) -> c.name == name
      return klass if klass
      new_class = {name: name, members: [], methods: []}
      namespace.classes.push new_class
      return new_class

    project.find_type = (namespace_name, name) ->
      namespace = project.register_namespace namespace_name
      return _.find namespace.types, (t) -> t.namespace == namespace_name and t.name == name

    project.find_class = (namespace_name, name) ->
      namespace = project.register_namespace namespace_name
      return _.find namespace.classes, (t) -> t.namespace == namespace_name and t.name == name

    project.to_json = ->
      pickle = {name: project.name, language: project.language, namespaces: project.namespaces}
      return JSON.stringify pickle

    project.register_type 'std', '*', 8
    project.register_type 'std', 'char', 1
    project.register_type 'std', 'uint32_t', 4
    project.register_type 'std', 'int32_t', 4
    project.register_type 'std', 'uint64_t', 8
    project.register_type 'std', 'int64_t', 8

    return project


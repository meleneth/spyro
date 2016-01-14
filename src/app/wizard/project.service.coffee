## NNWO
# Project
# {name: '', language: '', namespaces: []}
# Namespace
# {name: '' types: [], classes: []}
# Class
# {namespace: '', name: '', methods: [], members: []}
# Type
# {namespace: '', name: ''}
# Method:
# {namespace: '', class: '', name: '', return_type: '', params: []}
# Param:
# {type: '', name: ''}


angular.module "spyro"
  .service "Project", ->
    project = {name: '', language: 'c++', namespaces: []}

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

    project.find_namespace = (name) ->
      return _.find project.namespaces, (n) -> n.name == name

    project.find_type = (namespace_name, name) ->
      namespace = project.register_namespace namespace_name
      return _.find namespace.types, (t) -> t.name == name

    project.find_class = (namespace_name, name) ->
      namespace = project.register_namespace namespace_name
      return _.find namespace.classes, (c) -> c.name == name

    project.to_json = ->
      pickle = {name: project.name, language: project.language, namespaces: project.namespaces, types: project.types, classes: project.classes}
      return angular.toJson pickle

    project.resolve = (needle) ->
      info = _.split needle, "::"
      namespace = project.find_namespace info[0]
      return false unless namespace
      t = project.find_type namespace.name, info[1]
      return t if t
      c = project.find_class namespace.name, info[1]
      return c if c
      return false


    project.register_type 'std', '*', 8
    project.register_type 'std', 'char', 1
    project.register_type 'std', 'uint32_t', 4
    project.register_type 'std', 'int32_t', 4
    project.register_type 'std', 'uint64_t', 8
    project.register_type 'std', 'int64_t', 8

    return project


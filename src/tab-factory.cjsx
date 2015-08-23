React        = require "react"
EventEmitter = require "eventemitter3"

Tab            = require "./components/tab"
Panel          = require "./components/panel"

EVENT_NAME = "react-tab-factory:tab-changed"

class TabFactory
  constructor: ->
    @_emitter = new EventEmitter()
    @_tabIndex = 0
    @_panelIndex = 0
    @_selectedIndex = 0

    @tabClassNames =
      normal: ""
      active: "active"

    @panelClassName = ""
    @performant = false

  addListener: (listener) ->
    @_emitter.on EVENT_NAME, listener

  removeListener: (listener) ->
    @_emitter.removeListener EVENT_NAME, listener

  notify: ->
    @_emitter.emit EVENT_NAME, @_selectedIndex

  select: (index) ->
    @_selectedIndex = index
    @notify()

  getSelectedIndex: ->
    @_selectedIndex

  createTab: (handler, props, options) ->
    options = {} if !options?

    currentIndex = @_tabIndex
    @_selectedIndex = currentIndex if options.selected

    @_tabIndex++

    <Tab
      index={currentIndex}
      factory={@}
      handler={handler}
      opts={props}
    />

  createPanel: (handler, props, options) ->
    options = {} if !options?

    currentIndex = @_panelIndex
    @_panelIndex++

    <Panel
      index={currentIndex}
      factory={@}
      handler={handler}
      opts={props}
      preMount={options.preMount}
    />

module.exports = TabFactory

React = require "react"
EventEmitter = require "eventemitter3"
Tab = require "./components/tab"
Panel = require "./components/panel"

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

  createTab: (handler, selected, props) ->

    currentIndex = @_tabIndex
    @_selectedIndex = currentIndex if selected

    @_tabIndex++

    <Tab
      index={currentIndex}
      classNames={@tabClassNames}
      factory={@}
      handler={handler}
      opts={props}
    />

  createPanel: (handler, props) ->
    currentIndex = @_panelIndex
    @_panelIndex++

    <Panel
      index={currentIndex}
      className={@panelClassName}
      factory={@}
      handler={handler}
      opts={props}
    />

module.exports = TabFactory

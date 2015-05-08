React = require "react"
EventEmitter = require "eventemitter3"
Tab = require "./components/tab.cjsx"

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

  createTab: (child, selected) ->

    currentIndex = @_tabIndex
    @_selectedIndex = currentIndex if selected

    @_tabIndex++

    <Tab index={currentIndex} classNames={@tabClassNames} factory={@}>
      {child}
    </Tab>

  createPanel: (child) ->

module.exports = TabFactory

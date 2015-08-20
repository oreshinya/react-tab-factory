React = require "react"

Tab = React.createClass
  propTypes:
    index: React.PropTypes.number
    factory: React.PropTypes.object
    handler: React.PropTypes.func
    opts: React.PropTypes.object

  getInitialState: ->
    selectedIndex = @props.factory.getSelectedIndex()
    {selected: selectedIndex is @props.index}

  componentDidMount: ->
    @props.factory.addListener @_onFactoryUpdate

  componentWillUnmount: ->
    @props.factory.removeListener @_onFactoryUpdate

  _onFactoryUpdate: (index) ->
    selected = index is @props.index
    @setState selected: selected

  _getClassNameSet: ->
    @props.factory.tabClassNames

  _getClassName: ->
    set = @_getClassNameSet()

    if @state.selected
      set.active
    else
      set.normal

  _onClick: (e) ->
    @props.factory.select @props.index
    e.preventDefault()

  render: ->
    <div className={@_getClassName()} onClick={@_onClick}>
      <@props.handler selected={@state.selected} opts={@props.opts} />
    </div>

module.exports = Tab

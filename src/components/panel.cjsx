React = require "react"

Panel = React.createClass
  propTypes:
    index: React.PropTypes.number
    className: React.PropTypes.string
    factory: React.PropTypes.object
    handler: React.PropTypes.func
    opts: React.PropTypes.object

  getInitialState: ->
    index = @props.factory.getSelectedIndex()
    selected = @_isSelected index
    {
      selected: selected
      initialSelected: selected
    }

  componentDidMount: ->
    @props.factory.addListener @_onFactoryUpdate

  componentWillUnmount: ->
    @props.factory.removeListener @_onFactoryUpdate

  _isSelected: (index) ->
    @props.index is index

  _onFactoryUpdate: (index) ->
    selected = @_isSelected index
    state = selected: selected
    if selected and !@state.initialSelected
      state.initialSelected = true
    @setState state

  _getStyle: ->
    display = "none"
    display = "block" if @state.selected
    {display: display}

  render: ->
    <div className={@props.className} style={@_getStyle()}>
      {
        if @state.initialSelected
          <@props.handler opts={@props.opts} />
      }
    </div>

module.exports = Panel

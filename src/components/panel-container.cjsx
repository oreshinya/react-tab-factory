React = require "react"

PanelContainer = React.createClass
  propTypes:
    className: React.PropTypes.string

  render: ->
    <div className={@props.className} style={@_getStyle()}>
      {@props.children}
    </div>

  _getStyle: ->
    position: "relative"

module.exports = PanelContainer

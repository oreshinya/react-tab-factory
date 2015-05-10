# ReactTabFactory
Simple tab component with React.

- **Mount with a delay**  
The content panel is mounted, when the tab is clicked for the first time.

- **Reuse mounted component**  
If you switch the tab,  
the content panel those made previously is displayed in the state at that time.

- **No styles**  
This doesn't have design theme.  
You can freely mark up css.

- **Structure DOM freely**  
The tab and the panel does not need to be the same hierarchy.  
You will be able to structure the tab or panel freely.

## Demo
http://oreshinya.github.io/react-tab-factory/example/

## Installation

```
$ npm install --save react-tab-factory
```

## Usage

```coffee

TabFactory = require "react-tab-factory"

tabMixin =
  _getStyle: ->
    fontWeight = "normal"
    fontWeight = "bold" if @props.selected
    {fontWeight: fontWeight}

FirstTab = React.createClass
  render: ->
    <span style={@_getStyle()}>Tab 1</span>

SecondTab = React.createClass
  render: ->
    <span style={@_getStyle()}>Tab 2</span>

FirstPanel = React.createClass
  render: ->
    <div className="panel-content">Panel 1</div>

SecondPanel = React.createClass
  render: ->
    <div className="panel-content">Panel 2</div>

App = React.createClass
  getInitialState: ->
    factory = new TabFactory()
    factory.tabClassNames =
      normal: "tab"
      active: "tab active"
    
    factory.panelClassName = "panel"
    {factory: factory}

  render: ->
    <div id="app">
      <div className="tab-container">
        {@state.factory.createTab FirstTab}
        {@state.factory.createTab SecondTab}
      </div>
      <div className="panel-container">
        {@state.factory.createPanel FirstPanel}
        {@state.factory.createPanel SecondPanel}
      </div>
    </div>
```

## API

### Instantiate
```coffee
factory = new TabFactory()
```

### Configuration
- **factory.tabClassNames:**  
Configure tab class name.
```coffee
factory.tabClassNames =
  normal: "tab"
  active: "tab active"
```

- **factory.panelClassName:**  
Configure panel class name.
```coffee
factory.panelClassName = "panel"
```

### Create Element
- **factory.createTab(handler, selected):**  
Create tab. `handler` is ReactClass.  
if selected is true, it is default tab.
The default selected tab is first tab.  
The handler's props is passed `selected`.
```coffee
factory.createTab FirstTab
```

- **factory.createPanel(handler):**  
Create content panel. `handler` is ReactClass.
```coffee
factory.createPanel FirstPanel
```

## Example
Go to https://github.com/oreshinya/react-tab-factory/tree/master/example !

## LICENSE
MIT

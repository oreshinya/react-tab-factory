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

ReactTabFactory = require "react-tab-factory"
TabFactory = ReactTabFactory.TabFactory

tabMixin =
  _getStyle: ->
    fontWeight = "normal"
    fontWeight = "bold" if @props.selected
    {fontWeight: fontWeight}

FirstTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>Tab 1</span>

SecondTab = React.createClass
  mixins: [tabMixin]
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

## Performant option
If a panel has too many elements, switching tab will be very slow.  
In case of it, you can set performant option to factory,  
and create `PanelContainer` as panels parent.  

```coffee
ReactTabFactory = require "react-tab-factory"
TabFactory = ReactTabFactory.TabFactory
PanelContainer = ReactTabFactory.PanelContainer

App = React.createClass
  getInitialState: ->
    factory = new TabFactory()
    factory.tabClassNames =
      normal: "tab"
      active: "tab active"

    factory.panelClassName = "panel"
    factory.performant = true
    {factory: factory}

  render: ->
    <div id="app">
      <div className="tab-container">
        {@state.factory.createTab FirstTab}
        {@state.factory.createTab SecondTab}
      </div>
      <PanelContainer className="panel-container">
        {@state.factory.createPanel FirstPanel}
        {@state.factory.createPanel SecondPanel}
      </PanelContainer>
    </div>
```

**But use performant option carefully.**  
If performant option is false, the factory switches tab with css `display` property.  
If performant option is true, to reduce rendering and painting,  
the factory switches tab with css `position: absolute` and `z-index`.  
These may lead to side effects.

## API
### Property
```coffee
ReactTabFactory = require "react-tab-factory"
TabFactory = ReactTabFactory.TabFactory
PanelContainer = ReactTabFactory.PanelContainer
```

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

- **factory.performant**  
```coffee
factory.performant = true # default is false
```

### Create Element
- **factory.createTab(handler, selected, props):**  
Create tab. `handler` is ReactClass.  
if selected is true, it is default tab.  
The default selected tab is first tab.  
The handler's props is passed `selected` and `opts` that has passed props.
```coffee
factory.createTab FirstTab
```

- **factory.createPanel(handler, props):**  
Create content panel. `handler` is ReactClass.  
The handler's props is passed `selected` and `opts` that has passed props.
```coffee
factory.createPanel FirstPanel
```

## Example
Go to https://github.com/oreshinya/react-tab-factory/tree/master/example !

## LICENSE
MIT

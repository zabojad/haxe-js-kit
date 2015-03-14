package js.npm;

#if macro
import haxe.macro.Expr;
#end
import js.html.Element;
import js.html.Event;
import js.html.EventTarget;
import js.npm.ObjectAssign;
import js.npm.react.Component;

//@:native('React')
// TODO check that static work, since react provide its own way of generating statics
// http://facebook.github.io/react/docs/component-specs.html
extern class React 
implements npm.Package.Require<"react","0.12.2">
{
  static function render<P,S>(component : Component<P,S>, container : Element, ?callback : Void -> Void) : Component<P,S>;
  // @:deprecated
  // static function renderComponent(component : ReactComponent, container : Element, ?callback : Void -> Void) : ReactComponent;
  static function unmountComponentAtNode(container : Element) : Bool;
  static function renderComponentToString<P,S>(component : Component<P,S> ) : String;
  static function renderComponentToStaticMarkup<P,S>(component : Component<P,S>) : String;
  static var DOM(default, null) : ReactDOM;

  static public function createElement<P,S>( type : Dynamic, ?props : {} , ?childs : Fragment ) : Component<P,S>;
  public static function createClass(cl:Dynamic) : Dynamic;
  
}




// TODO state should be typed
// TODO props should be typed?
// extern class ReactComponent {
// #if !macro
//   function getDOMNode() : Element;
//   function setProps(nextProps : Dynamic) : Void;
//   function replaceProps(nextProps : Dynamic) : Void;
//   function transferPropsTo(targetComponent : ReactComponent) : Void;
//   function setState(nextState : Dynamic, ?callback : Void -> Void) : Void;
//   function replaceState(nextState : Dynamic, ?callback : Void -> Void) : Void;
//   function forceUpdate(?callback : Void -> Void) : Void;
//   function isMounted() : Bool;
//   function getInitialState() : Dynamic;
//   function getDefaultProps() : Dynamic;
//   var props(default, null) : ReactProps;
//   var state(default, null) : Dynamic;
//   var refs(default, null) : Dynamic;
//   // TODO ???
//   var propTypes(default, null) : Dynamic;
//   // TODO ???
//   var mixins(default, null) : Array<Dynamic>;
//   var displayName(default, null) : String;
//   // TODO check that has a method render() : ReactComponent
//   // TODO check that might have a method componentWillMount() : Void
//   // TODO check that might have a method componentWillUnmount() : Void
//   // TODO check that might have a method componentDidMount() : Void
//   // TODO check that might have a method componentWillReceiveProps(nextProps : Dynamic) : Void
//   // TODO check that might have a method componentWillReceiveState(nextState : Dynamic) : Void
//   // TODO check that might have a method shouldComponentUpdate(nextProps : Dynamic, nextState : Dynamic) : Bool
//   // TODO check that might have a method componentWillUpdate(nextProps : Dynamic, nextState : Dynamic) : Void
//   // TODO check that might have a method componentDidUpdate(nextProps : Dynamic, nextState : Dynamic) : Void
//   #end
// }

extern class ReactProps implements Dynamic {
  // TODO aVoid Dynamic if possible
  var children(default, null) : Dynamic;
}

extern class ReactDOM {

}

#if !macro
extern class SyntheticEvent {
  var bubbles(default, null) : Bool;
  var cancelable(default, null) : Bool;
  var currentTarget(default, null) : EventTarget;
  var defaultPrevented(default, null) : Bool;
  var eventPhase(default, null) : Int;
  var isTrusted(default, null) : Bool;
  var nativeEvent(default, null) : Event;
  function preventDefault() : Void;
  function stopPropagation() : Void;
  var target(default, null) : EventTarget;
  var timeStamp(default, null) : Date;
  var type(default, null) : String;
}
#end

// TODO more on events here: http://facebook.github.io/react/docs/events.html
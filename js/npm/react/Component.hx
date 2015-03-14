package js.npm.react;

@:remove
abstract Fragment(Dynamic) 
from Component<Dynamic,Dynamic> 
from Int
from String 
from Bool
{
  @:from inline static function fromString( str : String ) : Fragment {
    return untyped str;
  }

  @:from inline static function fromInt( i : Int ) : Fragment {
    return untyped i;
  }

  @:from inline static function fromComponent( c : Component<Dynamic,Dynamic> ) : Fragment {
    return untyped c;
  }

  @:from inline static function fromBool( b : Bool ) : Fragment {
    return untyped b;
  }
}

// FIXME : rename or something
@:native('{}')
extern class Component<P,S> {
  var props : P;
  var state : S;
  function render() : Fragment;
}
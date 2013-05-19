package npm;

/* just a little nicer Json package */

class Json extends haxe.Json {

	var indent : Int;

	public static function stringify( value : Dynamic ) : String {
		#if (php && !haxeJSON)
		return phpJsonEncode(value);
		#elseif (flash11 && !haxeJSON)
		return null;
		#else
		var j = new Json();
		j.indent = 0;
		return j.toString(value);
		#end
	}
	
	override function fieldsString( v : Dynamic, fields : Array<String> )
	{
		//trace("here");
		var first = true;
		addChar('{'.code);
		addChar("\n".code);
		indent++;
		for( f in fields ) {
			var value = Reflect.field(v,f);
			if( Reflect.isFunction(value) ) continue;
			if( first ) first = false else {
				addChar(','.code);
				addChar("\n".code);
			}
			addIndent();
			quote(f);
			addChar(" ".code);
			addChar(':'.code);
			addChar(" ".code);
			toStringRec(f,value);
		}
		indent--;
		addChar("\n".code);
		addIndent();
		addChar('}'.code);
	}

	function addIndent(){
		for(_ in 0...indent) addChar("\t".code);
	}

	override function toStringRec(k:Dynamic, v:Dynamic) {
		if (replacer != null) v = replacer(k, v);
		switch( Type.typeof(v) ) {
		case TUnknown:
			add('"???"');
		case TObject:
			objString(v);
		case TInt:
			add(v);
		case TFloat:
			add(v+1==v ? null : v);
		case TFunction:
			add('"<fun>"');
		case TClass(c):
			if( c == String )
				quote(v);
			else if( c == Array ) {
				var v : Array<Dynamic> = v;
				indent++;
				addChar('['.code);
				addChar("\n".code);
				addIndent();
				var len = v.length;
				if( len > 0 ) {
					toStringRec(0,v[0]);
					var i = 1;
					while( i < len ) {
						addChar(','.code);
						addChar("\n".code);
						addIndent();
						toStringRec(i,v[i++]);
					}
				}
				indent--;
				addChar("\n".code);
				addIndent();
				addChar(']'.code);
			} else if( c == #if haxe3 Map #else Hash #end ) {
				var v : #if haxe3 Map<String,Dynamic> #else Hash<Dynamic> #end = v;
				var o = {};
				for( k in v.keys() )
					Reflect.setField(o,k,v.get(k));
				objString(o);
			} else
				#if flash9
				classString(v);
				#else
				objString(v);
				#end
		case TEnum(_):
			var i : Dynamic = Type.enumIndex(v);
			add(i);
		case TBool:
			add(#if php (v ? 'true' : 'false') #else v #end);
		case TNull:
			add('null');
		}
	}

}
package js.npm;

typedef ReduxLocalStorageConfig = {
	? key : String,
	? slicer : Dynamic
}

/**
Extern for [ReduxLocalStorage](https://github.com/elgerlambert/redux-localstorage)
**/
@:jsRequire('redux-localstorage')
extern class ReduxLocalStorage {
	@:selfCall
	static public function persistState(? paths : haxe.extern.EitherType<String,Array<String>>, ? config : ReduxLocalStorageConfig) : Dynamic;
}
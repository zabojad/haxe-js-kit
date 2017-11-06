package js;

@:native("Object")
extern class Object {

	static public function assign(obj1 : Dynamic, obj2 : haxe.extern.Rest<Dynamic>) : Dynamic;

	static public function create() : Dynamic;

	static public function defineProperty() : Dynamic;

	static public function defineProperties() : Dynamic;

	static public function entries()  : Dynamic;

	static public function freeze() : Dynamic;

	static public function getOwnPropertyDescriptor() : Dynamic;

	static public function getOwnPropertyDescriptors() : Dynamic;

	static public function getOwnPropertyNames() : Dynamic;

	static public function getOwnPropertySymbols() : Dynamic;

	static public function getPrototypeOf() : Dynamic;

	static public function is() : Dynamic;

	static public function isExtensible() : Dynamic;

	static public function isFrozen() : Dynamic;

	static public function isSealed() : Dynamic;

	static public function keys() : Dynamic;

	static public function preventExtensions() : Dynamic;

	static public function seal() : Dynamic;

	static public function unobserve() : Dynamic;

	static public function values() : Dynamic;
}

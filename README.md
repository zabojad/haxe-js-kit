# A node.js SDK for Haxe

A collection of externs and tools to quickly get started with [Haxe](http://www.haxe.org)/[Node.js](http://nodejs.org)

**Warning : This is a work in progress and is definitely not stable nor complete !**

## Features

### Type signatures

The library contains type signatures for :

* **The base [node.js API](http://nodejs.org/api/)**
* **Common NPM libraries** such as :
	* **[Connect.js](http://www.senchalabs.org/connect/)** middleware framework for node
	* **[Express.js](http://expressjs.com/)** web application framework for node
	* and more to come ;)
	
We try to keep the externs as close as possible to their native APIs, 
while sticking as much as possible to the Haxe type / package system.

This means :
* **Splitting the APIs in modules** so the structure is as close as possible to the native API docs.
  This should also allow most code examples to look as similar as possible in JS and in Haxe.
* **Using extern classes rather than typedefs** when possible 
  (typedefs should be used only for simple JS key/value objects such as option objects)
* **Using packages rather than static variables** when possible 
  (``new js.npm.connect.CookieParser()`` rather than ``js.npm.Connect.cookieParser()``)
* Assuming that in most cases, instantiation using simple JS calls (like ``var app = express()``) 
  is similar to using ``new`` in Haxe (like ``var app = new Express()``)

### NPM integration

The library provides an easy way to manage [NPM](https://npmjs.org/) dependecies.

#### Including NPM packages

You can map your extern classes to an NPM package by implementing `npm.Package.Require` or `npm.Package.RequireNamespace`.

For example :
```haxe
// js/npm/MyPackage.hx
package js.npm;
extern class MyPackage
implements npm.Package.Require<"my-package","*">
```
```js
// Test.hx
var test = new js.npm.MyPackage();
```
```js
// resulting Javascript output:
var js_npm_MyPackage = require('my-package');
var test = new js_npm_MyPackage();
```

Sometimes, a single ``require`` exports several objects that can be considered individual classes in Haxe.

In such cases you can use ``RequireNamespace``:
```haxe
// js/node/http/Server.hx
package js.node.http;
extern class Server
implements npm.Package.RequireNamespace<"http","*">
```
```js
// resulting Javascript output:
var js_node_http_Server = require('http').Server;
```

#### Exporting your projects' dependencies

All NPM packages included this way can be exported by the Haxe compiler, typically to a ``package.json`` file, 
so they can be automatically installed using ``npm install``

You just add to add this flag to your ``build.hxml`` script :
```
--macro npm.Package.export("package.json")
```

Note that the macro will parse the package file, 
add dependencies to it, 
and then rewrite the whole json file.

**This means that it will remove any comments, and may change formatting.**

The process is incremental, though, which means that :

* other dependencies you may have added manually will be kept.
* unused dependencies will remain unless you remove them manually

Please also note that the dependency system currently doesn't manage package versions / SemVer.

## Todo

* Continue integrating / cleaning / completing externs, mainly from [nodejs_externs](https://github.com/dionjwa/nodejs_externs)
* More libraries (Mongoose, ...)
* Complete the node API
* Improve NPM integration (SemVer, less intrusive dependency export)
* Publish to haxelib

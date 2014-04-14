package test;

import js.npm.mongoose.macro.Model;
import js.npm.Mongoose.mongoose;

typedef StuffData = {
	test : String,
	foo : Int,
	?bar : {
		hello : String,
		world : Array<Dynamic>
	}
}

// declare the model
// the typedef fields will be "copied" to Stuff instance
class Stuff extends Model<StuffData>{}
class StuffManager extends js.npm.mongoose.macro.Manager<StuffData,Stuff>{}

class Mongoose {
	
	static function main(){
		// connect
		var db = mongoose.connect("mongodb://localhost/test_mongoose");

		// build the model
		var stuff = StuffManager.build(db,"Stuff");

		// use the model
		trace("running test");
		stuff.remove({}, function(err){
			trace("cleared DB");
			var d = {
				test : "test",
				foo : 1
			};
			stuff.create( d , function(err, doc){
				trace("foo", doc.foo);
				trace("test",doc.test);
				
			} );
		});

	}

}
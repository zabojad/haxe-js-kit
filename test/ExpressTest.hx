package test;

import js.npm.express.Request;
import js.npm.express.Response;

using js.npm.express.Session;

class ExpressTest {
	static function main(){
		var PORT = 9000;
		var app = new js.npm.Express();
		var secret = 'mySecret';
		app.set('test','toto');
		app.use( new js.npm.express.CookieParser( secret ) );
		app.use( new Session({ secret : secret }) );

		/** custom middleware **/
		app.use( function(req,_,next){
			trace("got request",req.originalUrl,req.session());
			next();
		});
		
		/** all verbs route on / **/
		app.all('/', function(req,res){
			var session = req.session();
			if( session.n == null ){
				session.n = 1;
			}
			res.send("HELLO " + session.n++ );
		});

		/** custom verb route **/
		app.head('/',function(req,res,next){
			trace('HEAD REQUEST');
			next();
		});

		/** otherwise, go static **/
		app.use( new js.npm.express.Static('.') );
		
		trace('listening to $PORT');
		app.listen(PORT);
	}
}
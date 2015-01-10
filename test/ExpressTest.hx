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
		app.use(function(_,_,next){
			trace("got request");
			next();
		});
		app.all('/', function(req:Request,res:Response){
			var session = req.session();
			if( session.n == null ){
				session.n = 1;
			}
			res.send("HELLO " + session.n++ );

		});
		app.use( new js.npm.express.Static('.') );
		
		trace('listening to $PORT');
		app.listen(PORT);
	}
}
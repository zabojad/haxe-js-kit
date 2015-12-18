package js.npm.connect;


typedef Middleware<R0,R1> = R0 -> R1 -> (Dynamic->Void) -> Dynamic;

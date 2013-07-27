package js.support;

typedef Callback<A> = Null<Error> -> Null<A> -> Void;

typedef Callback2<A,B> = Null<Error> -> Null<A> -> Null<B> -> Void;
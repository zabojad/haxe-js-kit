package js.npm.zombie;

typedef Promise<T, T2> = {
	function then<T3, T4>(success : T -> T3, ?error : T2 -> T4) : Promise<T3, T4>;
}

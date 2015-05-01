package js.node.stream;

import js.node.stream.Duplex;

extern class Transform 
extends Duplex
implements npm.Package.RequireNamespace<"stream","*"> 
{}

interface ITransform
extends IDuplex
{}
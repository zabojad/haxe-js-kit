package js.npm.mongoose.macro;

import js.npm.mongoose.Model;
import js.npm.mongoose.Mongoose;

@:autoBuild( util.Mongoose.buildManager( js.npm.mongoose.macro.Manager ) )
class Manager<T,M>
extends js.npm.mongoose.Model.TModels<T,M>
{}
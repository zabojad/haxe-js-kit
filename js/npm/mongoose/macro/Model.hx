package js.npm.mongoose.macro;

import js.npm.mongoose.Model;
import js.npm.mongoose.Mongoose;

@:autoBuild( util.Mongoose.buildModel( js.npm.mongoose.macro.Model ) )
extern class Model<T>
extends js.npm.mongoose.Model<T> {}
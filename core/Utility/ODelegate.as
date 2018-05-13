
class ODelegate
{
    public static function create(t:Object, f:Function):Function
    {
        var _args:Array = arguments.slice(2);
        var _func:Function = function():Void
        {
            var _newArgs:Array = arguments.concat(_args);
            f.apply(t, _newArgs);
        };
        return _func;
    }
}
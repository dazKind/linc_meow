/*
 * Copyright 2024-2024 Michael Bickel. All rights reserved.
 * License: https://github.com/dazKind/linc_meow/blob/main/LICENSE
 */

package meow;

@:include("linc_meow.h")
@:build(linc.Linc.touch())
@:build(linc.Linc.xml("meow"))
extern class Native_Meow {
    @:native('linc::meow::getHash')
    private static function _getHash(_b:cpp.Star<cpp.Void>, _s:Int):String;
    inline public static function hash(_bytes:haxe.io.Bytes):String {
        return _getHash(cast cpp.NativeArray.getBase(_bytes.getData()).getBase(), _bytes.length);
    }
}

#if (scriptable || cppia)
    class CppiaMeow {
        public static function hash(_bytes:haxe.io.Bytes):String
            return Native_Meow.hash(_bytes);
    }
    typedef Meow = CppiaMeow;
#else
    typedef Meow = Native_Meow;
#end

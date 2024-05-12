#include <hxcpp.h>
#include <cstdio>
#include "./linc_meow.h"

#include "meow_hash_x64_aesni.h"

namespace linc {
    namespace meow {
        ::String getHash(void *_b, int _s) {
            meow_u128 hash = MeowHash(MeowDefaultSeed, _s, _b);
            char buffer[35];
            sprintf(
                buffer, 
                "%08X-%08X-%08X-%08X", 
                MeowU32From(hash, 3),
                MeowU32From(hash, 2),
                MeowU32From(hash, 1),
                MeowU32From(hash, 0)
            );
            return ::String(buffer);
        }
    }
}
#ifndef IDE_GLOBAL_H
#define IDE_GLOBAL_H
/*
 * This file lives at ~/Arduino/include/ide_global.h
 * These are system wide globals that will be applied to all modules.
 * Use with Caution.
 *
 */

/*   <<< move this block to the wiki >>>
 * The Arduino IDE lacks a covenant way to set build defines for a project.
 *
 * This is a work around for that. It requires requires two .h files be
 * available for every build. An ide_global.h file, common for all sketches. It
 * can be empty just needs to exist. Second file, global.h, must exist in
 * every sketch. It too can be empty.
 *
 * Additions to either of these files can be seen by core and library modules.
 * By adding sketch specific defines to sketch/global.h, a library can see those
 * definitions and be built with options specific to a sketchs requirements.
 *
 * Additions of defines to ide_global.h, will effect all modules built.
 *
 * An example use case, I made changes to "cores/esp8266/Stream.cpp" to
 * skips calls to yield() when (timeout == 0). When timeout was zero, I did
 * not want or expect calls to block and call yieldas Stream was doing in
 * timedRead() and timedPeek(). These changes were made conditinal so that
 * they could be switched off if needed.
 *
 * Skips calls to yield() when (timeout == 0)
 * When timeout is zero, we do not want or expect calls to block and
 * call yield as Stream.cpp was doing in timedRead() and timedPeek().
 */
#define TIMEOUT_ZERO_ASYNC_FIX 1

#endif

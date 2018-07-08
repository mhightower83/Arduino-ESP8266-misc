#pragma once
/**
 * The following is true, when this file is placed in a sketch's directory:
 *
 * Defines, placed in this sketch's global.h file, are unique to this sketch's
 * build. And will be used by all library and core modules for that build.
 * To see how to make this work follow link:
 *   https://github.com/mhightower83/Arduino-IDE-Tweaks/wiki/global-defines
 */
#pragma message("globals.h was read")

/*
 *
 *  Go into Edit->File->Preferences. Find the selection: 
 *  "Show verbose output during: [] compilation [] upload"
 *  Check the check box for "compilation"
 *
 *  Also make note of your current setting for compiler warnings.
 *  Now change the "Compiler warnings:" to "none".
 *  This will help reduce some of the clutter in the output,
 *  so we can focus on what concerns us at this time.
 *
 *  Click on OK
 *
 *  Now run the compile.
 *
 *  On the very first compilation, every module is built. The above message
 *  should be present at the start of the compiler output for every module.
 *
 *  It will look something like this:
 *
 *     In file included from <command-line>:0:0:
 *
 *     C:\Users\...\AppData\...\arduino_build_.../sketch/global.h:10:9: note: #pragma message: global.h was read
 *
 *     #pragma message("global.h was read")
 *
 *
 *  Once you have confirmed that it worked.
 *  Run the compile a 2nd time without doing any edits.
 *
 *  The message should only show up for the "Compiling Sketch..."
 *  All other modules should not be recompiled, thus no message.
 *  For those you will see "Using previously compiled file: ..."
 *
 *
 *  Once the above has been confirmed, touch the ide_global.h file.
 *  Run compile again and observe that every module is being built
 *  as if for the 1st time. You will see the above #pragma message
 *  for every module compiled.
 *
 *  You should not see "Using previously compiled file: ..."
 *
 *  Don't forget to go back and restore "Compiler warnings" back to its previous setting.
 *
 */

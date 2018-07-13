#pragma once
/**
 * Defines, placed in this sketch's globals.h file, are unique to this sketch's
 * build. And will be used by all library and core modules for that build.
 * To see link for more information:
 *   https://github.com/mhightower83/Arduino-IDE-Tweaks/wiki/global-defines
 */

#pragma message("globals.h was read")


// https://stackoverflow.com/questions/1562074/how-do-i-show-the-value-of-a-define-at-compile-time
#define VALUE_TO_STRING(x) #x
#define VALUE(x) VALUE_TO_STRING(x)
#define VAR_NAME_VALUE(var) #var "="  VALUE(var)

#pragma message( VAR_NAME_VALUE( COMPILER_FLAGS_DOT_TXT ) )


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
 *     C:\Users\...\AppData\...\arduino_build_.../sketch/global.h:10:9: note: #pragma message: globals.h was read
 *
 *     #pragma message("globals.h was read")
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
 *
 */

--- main.c.orig	2005-10-26 06:08:25.000000000 +0800
+++ main.c	2011-04-22 23:14:33.000000000 +0800
@@ -88,6 +88,12 @@
    define_key("\e[15~", KEY_F(5)); define_key("\e[17~", KEY_F(6));
    define_key("\e[18~", KEY_F(7)); define_key("\e[19~", KEY_F(8));
    define_key("\e[20~", KEY_F(9)); define_key("\e[21~", KEY_F(10));
+   /* If "Sun Function-Keys" is enabled in your Xterm: */
+   define_key("\e[224z", KEY_F(1)); define_key("\e[225z", KEY_F(2));
+   define_key("\e[226z", KEY_F(3)); define_key("\e[227z", KEY_F(4));
+   define_key("\e[228z", KEY_F(5)); define_key("\e[229z", KEY_F(6));
+   define_key("\e[230z", KEY_F(7)); define_key("\e[231z", KEY_F(8));
+   define_key("\e[232z", KEY_F(9)); define_key("\e[233z", KEY_F(10));
 
    getmaxyx(stdscr, h, w);
    if (h < MIN_REQUIRED_HEIGHT || w < MIN_REQUIRED_WIDTH) {
@@ -335,9 +341,10 @@
 
    while (!quit) {
       if (zombie_count) {
-         zombie_count--;
-         chldpid = wait(NULL);
-         machmgr_handle_death(chldpid);
+         if ((chldpid = waitpid(-1, NULL, WNOHANG)) > 0) {
+            zombie_count--;
+            machmgr_handle_death(chldpid);
+         }
       }
 
       machmgr_update();

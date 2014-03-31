
$FreeBSD: head/sysutils/webmin/files/patch-software_freebsd-lib.pl 348727 2014-03-21 06:07:03Z olgeni $

--- software/freebsd-lib.pl.orig
+++ software/freebsd-lib.pl
@@ -21,7 +21,7 @@
 
 sub use_pkg_ng
 {
-return 0 if (!-x "/usr/sbin/pkg");
+return 0 if (!-e "/var/db/pkg/local.sqlite");
 local @lines = split(/\n/, &backquote_command(
 			"/usr/sbin/pkg info 2>/dev/null </dev/null"));
 return @lines > 1 ? 1 : 0;


$FreeBSD: head/textproc/p5-Pod-Perldoc/files/patch-Makefile.PL 340725 2014-01-22 17:40:44Z mat $

--- Makefile.PL.orig
+++ Makefile.PL
@@ -33,8 +33,6 @@
             'warnings'                  => '0',
            },
 
-    ($ENV{PERL_CORE} ? () : ('EXE_FILES' => [qw( perldoc )])),
-
 	'META_MERGE' => {
 		no_index => {
 			directory => 'corpus',
@@ -44,8 +42,6 @@
             },
 		},
 
-    'MAN1PODS' => { 'perldoc.pod' => 'blib/man1/perldoc.1' },
-
     ($^V >= 5.008001 ? ( 'INSTALLDIRS'  => 'perl' ) : ()),
 
     ( $EUMM_VERSION > 6.31 ? (

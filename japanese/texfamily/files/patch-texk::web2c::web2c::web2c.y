--- texk/web2c/web2c/web2c.y	Mon Jun  7 09:34:58 2004
+++ texk/web2c/web2c/web2c.y	Mon Jun  7 09:35:15 2004
@@ -135,6 +135,7 @@
 /* program statement.  Ignore any files.  */
 PROGRAM_HEAD:
 	  program_tok undef_id_tok PROGRAM_FILE_PART ';'
+	;
 
 PROGRAM_FILE_PART:
 	  '(' PROGRAM_FILE_LIST ')'

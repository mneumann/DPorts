--- src/llvm/lib/Target/X86/X86Subtarget.h.orig	2013-04-18 18:13:16 UTC
+++ src/llvm/lib/Target/X86/X86Subtarget.h
@@ -270,6 +270,9 @@ public:
   bool isTargetFreeBSD() const {
     return TargetTriple.getOS() == Triple::FreeBSD;
   }
+  bool isTargetDragonFly() const {
+    return TargetTriple.getOS() == Triple::DragonFly;
+  }
   bool isTargetSolaris() const {
     return TargetTriple.getOS() == Triple::Solaris;
   }

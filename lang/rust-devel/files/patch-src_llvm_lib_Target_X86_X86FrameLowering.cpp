--- src/llvm/lib/Target/X86/X86FrameLowering.cpp.orig	2014-10-17 08:25:56 UTC
+++ src/llvm/lib/Target/X86/X86FrameLowering.cpp
@@ -1370,7 +1370,8 @@ X86FrameLowering::adjustForSegmentedStac
   if (MF.getFunction()->isVarArg())
     report_fatal_error("Segmented stacks do not support vararg functions.");
   if (!STI.isTargetLinux() && !STI.isTargetDarwin() &&
-      !STI.isTargetWin32() && !STI.isTargetWin64() && !STI.isTargetFreeBSD())
+      !STI.isTargetWin32() && !STI.isTargetWin64() &&
+      !STI.isTargetFreeBSD() && !STI.isTargetDragonFly())
     report_fatal_error("Segmented stacks not supported on this platform.");
 
   // Eventually StackSize will be calculated by a link-time pass; which will
@@ -1424,6 +1425,9 @@ X86FrameLowering::adjustForSegmentedStac
     } else if (STI.isTargetFreeBSD()) {
       TlsReg = X86::FS;
       TlsOffset = 0x18;
+    } else if (STI.isTargetDragonFly()) {
+      TlsReg = X86::FS;
+      TlsOffset = 0x20; // use tls_tcb.tcb_segstack
     } else {
       report_fatal_error("Segmented stacks not supported on this platform.");
     }
@@ -1446,6 +1450,9 @@ X86FrameLowering::adjustForSegmentedStac
     } else if (STI.isTargetWin32()) {
       TlsReg = X86::FS;
       TlsOffset = 0x14; // pvArbitrary, reserved for application use
+    } else if (STI.isTargetDragonFly()) {
+      TlsReg = X86::FS;
+      TlsOffset = 0x10; // use tls_tcb.tcb_segstack
     } else if (STI.isTargetFreeBSD()) {
       report_fatal_error("Segmented stacks not supported on FreeBSD i386.");
     } else {
@@ -1458,7 +1465,8 @@ X86FrameLowering::adjustForSegmentedStac
       BuildMI(checkMBB, DL, TII.get(X86::LEA32r), ScratchReg).addReg(X86::ESP)
         .addImm(1).addReg(0).addImm(-StackSize).addReg(0);
 
-    if (STI.isTargetLinux() || STI.isTargetWin32() || STI.isTargetWin64()) {
+    if (STI.isTargetLinux() || STI.isTargetWin32() || STI.isTargetWin64() ||
+	STI.isTargetDragonFly()) {
       BuildMI(checkMBB, DL, TII.get(X86::CMP32rm)).addReg(ScratchReg)
         .addReg(0).addImm(0).addReg(0).addImm(TlsOffset).addReg(TlsReg);
     } else if (STI.isTargetDarwin()) {

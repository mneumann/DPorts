--- ./setup.py.orig	2014-07-27 09:34:58.000000000 +0000
+++ ./setup.py	2014-07-27 09:34:58.000000000 +0000
@@ -21,9 +21,5 @@
       platforms = ["Unix","Windows"],
       packages = ['impacket', 'impacket.dcerpc', 'impacket.examples', 'impacket.dcerpc.v5', 'impacket.dcerpc.v5.dcom'],
       scripts = glob.glob(os.path.join('examples', '*.py')),
-      data_files = [(os.path.join('share', 'doc', PACKAGE_NAME), ['README', 'LICENSE']+glob.glob('doc/*')),
-                    (os.path.join('share', 'doc', PACKAGE_NAME, 'testcases', 'dot11'),glob.glob('impacket/testcases/dot11/*')),
-                    (os.path.join('share', 'doc', PACKAGE_NAME, 'testcases', 'ImpactPacket'),glob.glob('impacket/testcases/ImpactPacket/*')),
-                    (os.path.join('share', 'doc', PACKAGE_NAME, 'testcases', 'SMB_RPC'),glob.glob('impacket/testcases/SMB_RPC/*'))],
       requires=['pycrypto (>=2.6)'],
       )

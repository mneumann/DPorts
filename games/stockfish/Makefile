# Created by: Gautam Mani <execve@gmail.com>
# $FreeBSD$

PORTNAME=	stockfish
PORTVERSION=	5
CATEGORIES=	games
MASTER_SITES=	http://stockfish.s3.amazonaws.com/:src \
		http://cl.ly/3x333m0G173F/download/:book \
		http://www.execve.net/sf/:book
DISTNAME=	stockfish-${PORTVERSION}-src
DISTFILES=	stockfish-${PORTVERSION}-src.zip:src \
		stockfish-231-book.zip:book

MAINTAINER=	execve@gmail.com
COMMENT=	Open source chess engine

LICENSE=	GPLv3

WRKSRC=		${WRKDIR}/${DISTNAME}/src
USES=		gmake compiler zip
MYARCH=		${ARCH}
BOOKDIR=	.
PORTDOCS=	Readme.md polyglot.ini
PORTDATA=	Book.bin

PLIST_FILES=	bin/stockfish

TGTBLD=		build
MYCC=		${COMPILER_TYPE}

OPTIONS_DEFINE=	DOCS POPCNT_ENABLED PROFILE_BUILD
POPCNT_ENABLED_DESC=	Use the POPCNT instruction
PROFILE_BUILD_DESC=	Make a Profile build

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MPROFILE_BUILD}
TGTBLD=		profile-build
.endif

.if ${PORT_OPTIONS:MPOPCNT_ENABLED}
.if ${ARCH} != "x86_64"
BROKEN=		POPCNT_ENABLED compiles only on amd64
.endif
.endif

# workaround the ARCH usage in the stockfish Makefile
.if ${ARCH} == "i386"
MYARCH=		x86-32
.elif ${ARCH} == "x86_64"
.if ${PORT_OPTIONS:MPOPCNT_ENABLED}
MYARCH=		x86-64-modern
.else
MYARCH=		x86-64
.endif
.endif
ALL_TARGET=	${TGTBLD} ARCH=${MYARCH} COMP=${MYCC}

.if ${ARCH} == "ia64" || ${ARCH} == "powerpc" || ${ARCH} == "sparc64"
BROKEN=		Does not compile on ia64, powerpc, or sparc64
.endif

post-patch:
	@${REINPLACE_CMD} -e "s/^PREFIX =/PREFIX ?=/" ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/stockfish ${STAGEDIR}${PREFIX}/bin/stockfish

	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/Readme.md ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/polyglot.ini ${STAGEDIR}${DOCSDIR}
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKDIR}/${BOOKDIR}/${PORTDATA} ${STAGEDIR}${DATADIR}/

.include <bsd.port.mk>

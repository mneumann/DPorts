# Created by: Glenn Johnson
# $FreeBSD$

PORTNAME=	tinker
PORTVERSION=	7.0.1
CATEGORIES=	biology
MASTER_SITES=	http://dasher.wustl.edu/tinker/downloads/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	General purpose molecular modelling package

LICENSE=	tinker
LICENSE_NAME=	TINKER license agreement
LICENSE_FILE=	${WRKSRC}/doc/license.txt
LICENSE_PERMS=	auto-accept

RESTRICTED=	author requests no distribution except from his FTP site

OPTIONS_DEFINE=	OPTIMIZED_FFLAGS DOCS EXAMPLES
OPTIMIZED_FFLAGS_DESC=	compilation optimizations

WRKSRC=		${WRKDIR}/${PORTNAME}
BUILD_WRKSRC=	${WRKSRC}/source
INSTALL_WRKSRC=	${WRKSRC}/source

USES=		fortran
MAKE_ENV=	HAVE_G2C=yes
MAKEFILE=	${WRKSRC}/make/Makefile
ALL_TARGET=	all
INSTALL_TARGET=	rename

MAKE_JOBS_UNSAFE=yes

SUB_FILES=	pkg-message

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MOPTIMIZED_FFLAGS}
FFLAGS+=	-O3 -ffast-math -finline-functions -fomit-frame-pointer -funroll-loops -fexpensive-optimizations
.if (${ARCH} == "i386")
FFLAGS+=	-mfancy-math-387 -malign-double
.endif # i386
.endif

post-extract:
	@${CHMOD} -R u+w ${WRKSRC}

pre-build:
	@${RM} -f ${BUILD_WRKSRC}/*.c

post-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
	${MKDIR} ${STAGEDIR}${DATADIR}/bench
	(cd ${WRKSRC}/bench && ${INSTALL_DATA} \
		0README *.log *.key *.run *.xyz results* \
		${STAGEDIR}${DATADIR}/bench)
	${MKDIR} ${STAGEDIR}${DATADIR}/params
	(cd ${WRKSRC}/params && ${INSTALL_DATA} * ${STAGEDIR}${DATADIR}/params)
	${MKDIR} ${STAGEDIR}${DATADIR}/test
	(cd ${WRKSRC}/test && ${INSTALL_DATA} * ${STAGEDIR}${DATADIR}/test)
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}/doc && ${INSTALL_DATA} 0README *.pdf *.txt ${STAGEDIR}${DOCSDIR})
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/example && ${INSTALL_DATA} \
		0README *.make *.dyn *.int *.frac *.key *.seq *.pdb *.xyz \
		${STAGEDIR}${EXAMPLESDIR})
.endif

.include <bsd.port.mk>

# Created by: Christopher Key <cjk32@cam.ac.uk>
# $FreeBSD$

PORTREVISION=	0
CATEGORIES=	audio lang
PKGNAMESUFFIX=	-sndfile

MAINTAINER=	freebsd-fpc@FreeBSD.org
COMMENT=	Free Pascal Interface to sndfile library

USE_FPC=	yes

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

OPTIONS_DEFINE=	LIBSNDFILE
LIBSNDFILE_DESC=	Install sndfile library
OPTIONS_DEFAULT=	LIBSNDFILE

LIBSNDFILE_LIB_DEPENDS=	libsndfile.so:${PORTSDIR}/audio/libsndfile

.include "${MASTERDIR}/Makefile"

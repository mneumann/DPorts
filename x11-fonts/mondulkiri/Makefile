# Created by: Kuan-Chung Chiu <buganini@gmail.com>
# $FreeBSD$

PORTNAME=	mondulkiri
PORTVERSION=	2
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/khmer/Fonts%20-%20Mondulkiri/Mondulkiri%20Unicode%20Fonts%20v2E3s/
DISTNAME=	Mondulkiri_Unicode_fonts_V2E3s

MAINTAINER=	buganini@gmail.com
COMMENT=	Mondulkiri Khmer fonts

RUN_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig

USES=		zip
NO_BUILD=	yes

FONTSDIR=	lib/X11/fonts/Khmer
PLIST_SUB+=	FONTSDIR=${FONTSDIR}

WRKSRC=		${WRKDIR}/Opentype\ only\ fonts

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${PREFIX}/${FONTSDIR}

.include <bsd.port.mk>

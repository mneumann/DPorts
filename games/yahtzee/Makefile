# Created by: Joel Sutton <sutton@aardvark.apana.org.au>
# $FreeBSD$

PORTNAME=	yahtzee
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_SUNSITE}
MASTER_SITE_SUBDIR=	games/strategy
DISTNAME=	${PORTNAME}-src

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Curses version of the dice game for one or more players

USES=		tar:Z
WRKSRC=		${WRKDIR}/${PORTNAME}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/yahtzee ${STAGEDIR}${PREFIX}/bin
	@${MKDIR} -m 0755 ${STAGEDIR}${DATADIR}
	${TOUCH} ${STAGEDIR}${DATADIR}/yahtzee.sco

.include <bsd.port.mk>

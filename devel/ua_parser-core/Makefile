# Created by: Dmitry Sivachenko <demon@FreeBSD.org>
# $FreeBSD$

PORTNAME=	ua_parser
PORTVERSION=	0.4.0
CATEGORIES=	devel
PKGNAMESUFFIX=	-core
DISTNAME=	${PORTNAME:S/_/-/}-${PORTVERSION}

MAINTAINER=	demon@FreeBSD.org
COMMENT=	Regex file for building language ports of Browserscope's UA parser

LICENSE=	APACHE20

USE_GITHUB=	yes
GH_ACCOUNT=	ua-parser
GH_PROJECT=	uap-core
GH_COMMIT=	c92cdb5
GH_TAGNAME=	${GH_COMMIT}

PLIST_FILES=	%%DATADIR%%/regexes.yaml
NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/regexes.yaml ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>

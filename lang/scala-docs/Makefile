# Created by: Alex Dupre <ale@FreeBSD.org>
# $FreeBSD$

PORTNAME=	scala-docs
PORTVERSION=	2.11.5
CATEGORIES=	lang java
MASTER_SITES=	http://www.scala-lang.org/files/archive/

MAINTAINER=	ale@FreeBSD.org
COMMENT=	Documentation for the Scala libraries & compiler

USES=		tar:txz
NO_BUILD=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

.include <bsd.port.options.mk>

.if ! ${PORT_OPTIONS:MDOCS}
IGNORE=		port only installs documentation
.endif

do-install:
	@${ECHO} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${STAGEDIR}/${DOCSDIR}
	@(cd ${WRKSRC}/api && ${COPYTREE_SHARE} \* ${STAGEDIR}/${DOCSDIR}/)
	@${ECHO} " [ DONE ]"

.include <bsd.port.mk>

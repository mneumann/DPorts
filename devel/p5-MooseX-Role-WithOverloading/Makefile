# Created by: Wen Heping <wen@FreeBSD.org>
# $FreeBSD$

PORTNAME=	MooseX-Role-WithOverloading
PORTVERSION=	0.16
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:ETHER
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Roles which support overloading

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Moose>=1.15:${PORTSDIR}/devel/p5-Moose \
		p5-MooseX-Types>=0:${PORTSDIR}/devel/p5-MooseX-Types \
		p5-aliased>=0:${PORTSDIR}/devel/p5-aliased \
		p5-namespace-autoclean>=0.16:${PORTSDIR}/devel/p5-namespace-autoclean \
		p5-namespace-clean>=0:${PORTSDIR}/devel/p5-namespace-clean
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

post-install:
	${CHMOD} u+w ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/MooseX/Role/WithOverloading/WithOverloading.so
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/MooseX/Role/WithOverloading/WithOverloading.so
	${CHMOD} u-w ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/MooseX/Role/WithOverloading/WithOverloading.so

.include <bsd.port.mk>

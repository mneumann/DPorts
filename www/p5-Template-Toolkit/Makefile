# Created by: clive
# $FreeBSD$

PORTNAME=	Template-Toolkit
PORTVERSION=	2.26
CATEGORIES=	www textproc perl5
MASTER_SITES=	CPAN \
		http://www.template-toolkit.org/download/
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Extensive Toolkit for template processing

BUILD_DEPENDS=	p5-AppConfig>=1.56:${PORTSDIR}/devel/p5-AppConfig
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Image-Size>=0:${PORTSDIR}/graphics/p5-Image-Size \
		p5-Pod-POM>=0:${PORTSDIR}/textproc/p5-Pod-POM

OPTIONS_DEFINE=	DATE_CALC IMAGE_INFO IMAGE_SIZE POD_POM
DATE_CALC_DESC=		With Date::Calc Plugin
IMAGE_INFO_DESC=	With Image::Info Plugin
IMAGE_SIZE_DESC=	With Image::Size Plugin
POD_POM_DESC=		With Pod::POM Plugin

USES=		perl5
USE_PERL5=	configure
CONFIGURE_ARGS=	TT_ACCEPT=y

DATE_CALC_BUILD_DEPENDS=	p5-Date-Calc>=0:${PORTSDIR}/devel/p5-Date-Calc
DATE_CALC_RUN_DEPENDS=		p5-Date-Calc>=0:${PORTSDIR}/devel/p5-Date-Calc

IMAGE_INFO_BUILD_DEPENDS=	p5-Image-Info>=0:${PORTSDIR}/graphics/p5-Image-Info
IMAGE_INFO_RUN_DEPENDS=		p5-Image-Info>=0:${PORTSDIR}/graphics/p5-Image-Info

IMAGE_SIZE_BUILD_DEPENDS=	p5-Image-Size>=0:${PORTSDIR}/graphics/p5-Image-Size
IMAGE_SIZE_RUN_DEPENDS=		p5-Image-Size>=0:${PORTSDIR}/graphics/p5-Image-Size

POD_POM_BUILD_DEPENDS=	p5-Pod-POM>=0:${PORTSDIR}/textproc/p5-Pod-POM
POD_POM_RUN_DEPENDS=	p5-Pod-POM>=0:${PORTSDIR}/textproc/p5-Pod-POM

post-patch:
	@${REINPLACE_CMD} -e '/PREFIX/ s|/usr/local|${PREFIX}/share|' \
		${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>

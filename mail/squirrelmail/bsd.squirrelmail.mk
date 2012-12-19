# $FreeBSD: ports/mail/squirrelmail/bsd.squirrelmail.mk,v 1.11 2012/11/17 05:59:15 svnexp Exp $
#
# $LastChangedDate: 2010-02-01 22:21:34 -0500 (Mon, 01 Feb 2010) $
#
# Common code for squirrelmail plugins.
#
# Created & tested by 
# Thomas Abthorpe <tabthorpe@FreeBSD.org>
# Philippe Audeoud <jadawin@FreeBSD.org>
# Some enhancements by
# Ion-Mihai "IOnut" Tetcu <itetcu@FreeBSD.org>
#
# This code is still a work in progress, and will likely need further
# tweaking. Feedback is always welcome.
#

CATEGORIES?=	mail www
MASTER_SITES?=	http://www.squirrelmail.org/plugins/
PKGNAMEPREFIX?=	squirrelmail-
PKGNAMESUFFIX?=	-plugin

RUN_DEPENDS+=	${SQUIRRELDIR}/index.php:${PORTSDIR}/mail/squirrelmail

.ifdef USE_SM_COMPAT
RUN_DEPENDS+=	${SQUIRRELDIR}/plugins/compatibility:${PORTSDIR}/mail/squirrelmail-compatibility-plugin
.endif

NO_BUILD=		yes
NO_WRKSUBDIR=	yes
USE_PHP?=		yes
WANT_PHP_WEB=	yes

IGNORE_WITH_PHP=5 # known incompatibilities with php-5.4, use 5.3 for now
DEFAULT_PHP_VER=53

SQUIRREL_PLUGIN_NAME?=   ${PORTNAME}
PLIST_SUB+=     SQUIRREL_PLUGIN_NAME=${SQUIRREL_PLUGIN_NAME}
SUB_LIST+=		SQUIRREL_PLUGIN_NAME=${SQUIRREL_PLUGIN_NAME}

# As with mail/squirreldir, if you were using WITHOUT_WWWDIR=yes,
# set SQUIRRELDIR=${PREFIX}/squirrelmail
SQUIRRELDIR?=	${PREFIX}/www/squirrelmail
PLIST_SUB+=		SQUIRRELDIR=${SQUIRRELDIR:S,${PREFIX}/,,}
SUB_LIST+=		SQUIRRELDIR=${SQUIRRELDIR}

.if exists(${FILESDIR}/pkg-message.in)
SUB_FILES=	pkg-message
.endif

.if !target(pre-everything)
pre-everything::
	@${ECHO_CMD} ""
.ifndef WITHOUT_ACTIVATE
	@${ECHO_CMD} "Activating plug-in in SquirrelMail after installation."
	@${ECHO_CMD} "If you don't want to automatically activate the plug-in set"
	@${ECHO_CMD} "WITHOUT_ACTIVATE=yes"
.else
	@${ECHO_CMD} "NOT Activating plug-in in SquirrelMail after installation."
	@${ECHO_CMD} "If you want to automatically activate the plug-in unset"
	@${ECHO_CMD} "WITHOUT_ACTIVATE"
.endif
	@${ECHO_CMD} ""
.endif

_SMSRCDIR?=	${SQUIRREL_PLUGIN_NAME}

.if !target(do-install)
do-install:
	cd ${WRKSRC}/${_SMSRCDIR} && ${FIND} -d . | \
		${CPIO} -dump ${SQUIRRELDIR}/plugins/${SQUIRREL_PLUGIN_NAME} >/dev/null 2>&1 && \
	${FIND} ${SQUIRRELDIR}/plugins/${SQUIRREL_PLUGIN_NAME} \
		-type d -exec chmod 755 {} \; && \
	${FIND} ${SQUIRRELDIR}/plugins/${SQUIRREL_PLUGIN_NAME} \
		-type f -exec chmod 644 {} \;
.endif

.if !target(post-install)
post-install:
.ifndef WITHOUT_ACTIVATE
.if exists( ${SQUIRRELDIR}/config/config.php )
	@${ECHO_CMD} "Activating plug-in in SquirrelMail"
	${SQUIRRELDIR}/config/conf.pl --install-plugin ${SQUIRREL_PLUGIN_NAME}
.endif
.else
	@${ECHO_CMD} "To activate the plug-in in SquirrelMail use"
	@${ECHO_CMD} "${SQUIRRELDIR}/config/conf.pl --install-plugin ${SQUIRREL_PLUGIN_NAME}"
.endif
	@${ECHO_CMD} ""

.if exists(${FILESDIR}/pkg-message.in)
	@${CAT} ${PKGMESSAGE}
	@${ECHO_CMD} ""
.endif
.endif

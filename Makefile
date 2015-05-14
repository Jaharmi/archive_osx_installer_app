USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=Archive\ OS\ X\ installer\ application
TITLE_NOSPACE=archive_osx_installer_app
REVERSE_DOMAIN=com.github.jaharmi.pkg
PACKAGE_VERSION=0.9.2
PACKAGE_ID=${REVERSE_DOMAIN}.${TITLE_NOSPACE}
PACKAGE_NAME=${TITLE}
PACKAGE_FILE=${PACKAGE_NAME}.pkg
DMG_NAME=${PACKAGE_NAME}-${PACKAGE_VERSION}.dmg
ZIP_NAME=${PACKAGE_FILE}-${PACKAGE_VERSION}.zip
PAYLOAD=\
	pack-usr-local-bin-archive_osx_installer_app

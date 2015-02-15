SPK_NAME = couchdb
SPK_VERS = 1.6.1
SPK_REV = 1
SPK_ICON = src/couchdb.png
DSM_UI_DIR = app

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = SynoCommunity
DESCRIPTION = CouchDB is a database that completely embraces the web. Store your data with JSON documents. Access your documents and query your indexes with your web browser, via HTTP. Index, combine, and transform your documents with JavaScript. CouchDB works well with modern web and mobile apps. You can even serve web apps directly out of CouchDB. And you can distribute your data, or your apps, efficiently using CouchDB’s incremental replication. CouchDB supports master-master setups with automatic conflict detection.
RELOAD_UI = yes
DISPLAY_NAME = CouchDB

HOMEPAGE = http://couchdb.apache.org/
LICENSE  =

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = couchdb_extra_install


include ../../mk/spksrc.spk.mk

.PHONY: couchdb_extra_install
couchdb_extra_install:
	install -m 755 -d $(STAGING_DIR)/app
	install -m 755 -d $(STAGING_DIR)/app/images
	for size in 16 24 32 48; do \
		convert $(SPK_ICON) -thumbnail $${size}x$${size} \
				$(STAGING_DIR)/app/images/$(SPK_NAME)-$${size}.png ; \
	done

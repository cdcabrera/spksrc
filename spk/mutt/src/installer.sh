#!/bin/sh

# Package
PACKAGE="mutt"
DNAME="Mutt"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PATH="${INSTALL_DIR}/bin:/usr/local/bin:/bin:/usr/bin:/usr/syno/bin"


preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}
    
    # Put mutt in the PATH
    mkdir -p /usr/local/bin
    ln -s ${INSTALL_DIR}/bin/mutt-utf8 /usr/local/bin/mutt

    exit 0
}

preuninst ()
{
    exit 0
}

postuninst ()
{
    # Remove link
    rm -f ${INSTALL_DIR}
    rm -f /usr/local/bin/mutt

    exit 0
}

preupgrade ()
{
    # Save configuration
    rm -fr ${TMP_DIR}/${PACKAGE}
    mkdir -p ${TMP_DIR}/${PACKAGE}
    mv ${INSTALL_DIR}/etc/Muttrc.local ${TMP_DIR}/${PACKAGE}/Muttrc.local

    exit 0
}

postupgrade ()
{
    # Restore configuration
    mv ${TMP_DIR}/${PACKAGE}/Muttrc.local ${INSTALL_DIR}/etc/Muttrc.local
    rm -fr ${TMP_DIR}/${PACKAGE}

    exit 0
}

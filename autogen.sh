#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="Gnome Applets"

(test -f $srcdir/configure.in \
  && test -f $srcdir/HACKING \
  && test -d $srcdir/gweather) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level gnome directory"
    exit 1
}


which gnome-autogen.sh || {
    echo "You need to install gnome-common from the GNOME CVS"
    exit 1
}
REQUIRED_AUTOMAKE_VERSION=1.9 \
USE_GNOME2_MACROS=1 \
USE_COMMON_DOC_BUILD=yes \
. gnome-autogen.sh
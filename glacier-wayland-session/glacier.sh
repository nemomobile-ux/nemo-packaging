#!/bin/sh

QT_QPA_EGLFS_INTEGRATION=eglfs_kms
GLACIER_NATIVEORIENTATION=1
QT_IM_MODULE=qtvirtualkeyboard
QT_QUICK_CONTROLS_STYLE=Nemo
LIPSTICK_OPTIONS="-plugin evdevtablet -platform eglfs -plugin evdevmouse evdevkeyboard"
/usr/bin/lipstick $LIPSTICK_OPTIONS


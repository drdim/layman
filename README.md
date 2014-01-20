Copyright 2012-2014 Bogatkin Dmitry

email: dr.dim.pro@gmail.com

skype: dr.dim.pro


Unofficial repository for products JetBrains and EAP version.


Add repository
==============

Install layman:

    # emerge -av layman

Add line to config /etc/layman.cfg (/etc/layman/layman.cfg):
change

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml

on

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://raw.github.com/drdim/layman/master/overlay.xml

Synchronize:

    # sudo layman -S

Add my repository:

    # sudo layman -a drdim

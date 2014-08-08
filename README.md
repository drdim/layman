Copyright 2012-2014 Bogatkin Dmitry

email: dr.dim.pro@gmail.com

skype: dr.dim.pro


Unofficial repository for products JetBrains and EAP version and my castom  ports.


Add repository
==============

Install layman:

    # emerge -av layman

<<<<<<< HEAD
Add line to config /etc/layman.cfg (/etc/layman/layman.cfg):
change

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml

on

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://raw.github.com/drdim/layman/extended/overlay.xml

=======
>>>>>>> master
Synchronize:

    # sudo layman -S

Add repository:

<<<<<<< HEAD
    # sudo layman -a drdim-extended
=======
    # sudo layman -a drdim

Install ebuild:
    
    # sudo emerge pycharm-community
>>>>>>> master

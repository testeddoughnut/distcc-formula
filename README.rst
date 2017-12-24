================
distcc-formula
================

A SaltStack formula to do stuff with distcc.

This has only been tested on Ubuntu 17.10. It might work on other Debian variants.

I'm a noob with Salt and honestly this is my first formula. Use at your own risk.
That being said, I have used it with success to speed up my Gentoo updates.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``distcc``
------------

Installs and configures distcc to be used as a client.

``distcc.server``
------------

Installs and configures distcc in server mode.

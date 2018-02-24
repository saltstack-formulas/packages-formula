================
packages-formula
================

A simple 'packages manager' formula, to install/remove packages without further
ado.

.. image:: https://travis-ci.org/saltstack-formulas/packages-formula.svg?branch=master

What this formula can do
========================

Many times, in the process of setting up a host/vm, you need to install/remove
packages with no extra configuration or setup. This formula tries to help with
that. It can get a list of packages from a pillar, and it will try to install
them.

It provides a few states to install/remove system packages (currently
Debian/Redhat families), Python packages (using pip states) and Ruby gems
(using gem states).

It can also provide basic dependency management on certain other states/packages.

What this formula can't do
==========================

This formula is not intended to configure packages, nor setup services or daemons.
When you need to do that for a package, you should probably be using another
formula.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``packages``
------------

Runs all the other states in the formula.

``packages.pkgs``
-----------------

You can specify:

* ``wanted`` system packages, which will be installed.
* ``unwanted`` system packages, which will be uninstalled.
* ``required system packages`` on which any of the ``wanted`` packages depend
  for their correct installation.
* ``required states`` on which any of the ``wanted`` packages depend for their
  correct installation.

``packages.pips``
-----------------

You can specify:

* ``wanted`` python packages, which will be installed using pip. Requires you
  specify the correct ``python-pip`` package for your distro, as a dependency
  (see the pillar.example)
* ``unwanted`` python packages, which will be uninstalled using pip.
* ``required system packages`` on which any of the ``wanted`` python packages
  depend for their correct installation. Usually, a ``python-pip`` package and/or
  some other compiler packages are required.
* ``required states`` on which any of the ``wanted`` packages depend for their
  correct installation (ie, ``epel`` for RedHat families).

``packages.gems``
-----------------

You can specify:

* ``wanted`` ruby packages, which will be installed using gem. Requires you
  specify the correct ``ruby`` package for your distro, as a dependency
  (see the pillar.example)
* ``unwanted`` ruby packages, which will be uninstalled using gem.
* ``required system packages`` on which any of the ``wanted`` ruby packages
  depend for their correct installation. Usually, a ``ruby`` package and/or
  some other compiler packages are required.
* ``required states`` on which any of the ``wanted`` packages depend for their
  correct installation (ie, ``epel`` for RedHat families).

``packages.remote_pkgs``
------------------------

You can specify a dictionary of remote system packages (deb/rpm) that you want
to install, in the format:

``name: url``

Testing
=======

Testing is done with `Test Kitchen <http://kitchen.ci/>`_
for machine setup and `inspec <https://www.inspec.io/docs/>`_
for integration tests.

Tested on

* Debian/9
* Centos/7
* Fedora/27
* Ubuntu/17.10


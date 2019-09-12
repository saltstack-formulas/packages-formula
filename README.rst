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

Allows you to manage system's packages. You can specify:

* ``held``: either a list of packages or a dict of `package: version`,
  which will be installed and pinned to the installed version using
  SaltStack's `hold/unhold` capability.

  When upgrading a version, the package will be temporarily unheld,
  upgraded and then held again.

  In the RedHat family, helding packages depend on a yum plugin that you
  need to install. In order to do this, you can add it using this formula, adding
  to your ``pkgs.required.pkgs`` one of the following packages:

  + CentOS
  ```
  packages:
    pkgs:
      required:
        pkgs:
          - yum-plugin-versionlock
  ```

  + Fedora > 26 with Python3:
  ```
  packages:
    pkgs:
      required:
        pkgs:
          - python3-dnf-plugin-versionlock
  ```

  + Fedora > 26 with Python2:
  ```
  packages:
    pkgs:
      required:
        pkgs:
          - python2-dnf-plugin-versionlock
  ```

* ``wanted``: a list of packages which will be installed. Packages in this
  list will be automatically unheld so, if you want to permanently unheld a
  package you were previously helding to a version, just move it from the
  ``held`` dict to this list.
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

``packages.npms``
-----------------

This formula **DOES NOT** install ``nodejs/npm``, as it's outside of its scope:
nodejs/npm that comes with the distros is usually outdated, so it's required to add
a repo, run scripts, etc, and this formula manages packages :)

You can use the `nodejs-formula <https://github.com/saltstack-formulas/node-formula>`_
and add a dependency for it in the pillar `npms:required:sls` (see the pillar.example)

You can specify:

* ``wanted`` npm packages, which will be installed using npm. Requires you
  specify the correct ``npm`` package for your distro, as a dependency
  (see the pillar.example)
* ``unwanted`` npm packages, which will be uninstalled using npm.
* ``required system packages`` on which any of the ``wanted`` npm packages
  depend for their correct installation. Usually, a ``npm`` package and/or
  some other compiler packages are required.
* ``required states`` on which any of the ``wanted`` packages depend for their
  correct installation (ie, ``epel`` for RedHat families).

``packages.archives``
-------------------

'Archive file` handler for common 'download' and 'checksum' states. All formats recognized by `salt.states.archive.extracted` (tar, rar, zip, etc) will be extracted. Alternatively `raw` formats are supported (`raw`, `bin`,) for standard and binary executable files.

* ``wanted`` archive package software, which will be installed by extraction.
* ``unwanted`` archive package software, which are uninstalled by directory removal.
* ``required archive packages`` on which any of the ``wanted`` items depend on. Optional.


``packages.snaps``
-----------------

You can specify:

* ``wanted`` snapd packages, which will be installed using snap.
* ``classic`` snapd packages, chich will be installed using snap with classic confinement.
* ``unwanted`` snapd packages, which will be uninstalled using snap.
* ``required system packages`` on which any of the ``wanted`` snapd packages
  depend for their correct installation.
* ``required states`` on which any of the ``wanted`` packages depend for their
  correct installation (ie, ``epel`` for RedHat families).

.. note::

    Centos has no native ``snapd`` package at this time.


``packages.golang``
-------------------

You can specify:

* ``clean`` golang packages, removed using ``go clean -i <item>...``.
* ``goget`` golang packages, installed using ``go get``.


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
* Debian/8 (with backports)
* Centos/7
* Fedora/27
* Ubuntu/16.04
* Ubuntu/18.04
* Opensuse/leap

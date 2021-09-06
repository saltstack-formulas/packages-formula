
Changelog
=========

`0.14.0 <https://github.com/saltstack-formulas/packages-formula/compare/v0.13.1...v0.14.0>`_ (2021-09-06)
-------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **rhel:** redhat enterprise 8 use dnf, not yum (\ `3e72c61 <https://github.com/saltstack-formulas/packages-formula/commit/3e72c61b20a84b985b90be811b2a72fb82aff249>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **3003.1:** update inc. AlmaLinux, Rocky & ``rst-lint`` [skip ci] (\ `5812d39 <https://github.com/saltstack-formulas/packages-formula/commit/5812d3913a2b401b760cdc0a77655a4f3a6e8ce8>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``inspec`` repo [skip ci] (\ `8a01261 <https://github.com/saltstack-formulas/packages-formula/commit/8a0126105d238239bffeb03ac36e0b6d5f8dd385>`_\ )
* **kitchen:** move ``provisioner`` block & update ``run_command`` [skip ci] (\ `f733e60 <https://github.com/saltstack-formulas/packages-formula/commit/f733e6058aebaf5d2181355f93b0bbcf67341dd3>`_\ )
* **kitchen+ci:** update with latest ``3003.2`` pre-salted images [skip ci] (\ `22bb960 <https://github.com/saltstack-formulas/packages-formula/commit/22bb960888b7fd7abe86feb4d4da0a09fe7d8c66>`_\ )
* add Debian 11 Bullseye & update ``yamllint`` configuration [skip ci] (\ `00d778f <https://github.com/saltstack-formulas/packages-formula/commit/00d778f476239fe0f555f8cf17c0236c4bbb6cc4>`_\ )
* **kitchen+gitlab:** remove Ubuntu 16.04 & Fedora 32 (EOL) [skip ci] (\ `e25a9a4 <https://github.com/saltstack-formulas/packages-formula/commit/e25a9a493c29b97fe4487329b1f7b82379011e66>`_\ )

Features
^^^^^^^^


* **alma+rocky:** add platforms (based on CentOS 8) [skip ci] (\ `5ac9cde <https://github.com/saltstack-formulas/packages-formula/commit/5ac9cde4e965fbea52623aaf30078da13c05f998>`_\ )

`0.13.1 <https://github.com/saltstack-formulas/packages-formula/compare/v0.13.0...v0.13.1>`_ (2021-06-14)
-------------------------------------------------------------------------------------------------------------

Code Refactoring
^^^^^^^^^^^^^^^^


* **includes:** Use relative state include (\ `abe8286 <https://github.com/saltstack-formulas/packages-formula/commit/abe828663efadf1696ace0e2288a405116b759f3>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* add ``arch-master`` to matrix and update ``.travis.yml`` [skip ci] (\ `931d4b5 <https://github.com/saltstack-formulas/packages-formula/commit/931d4b57a97d5bbdc684bebfcfaa95064b244e69>`_\ )
* **kitchen+gitlab:** adjust matrix to add ``3003`` [skip ci] (\ `5dc24b1 <https://github.com/saltstack-formulas/packages-formula/commit/5dc24b18be005ad65f966514d3e6a5f1fe20407b>`_\ )
* **vagrant:** add Windows 10 pre-salted box [skip ci] (\ `190bd64 <https://github.com/saltstack-formulas/packages-formula/commit/190bd644bfc6c5c0a7c08d69786f7f070ae71fbc>`_\ )
* **vagrant:** use pre-salted boxes & conditional local settings [skip ci] (\ `82e5538 <https://github.com/saltstack-formulas/packages-formula/commit/82e5538dec9403dc4fd29e4f34eb36b4773356eb>`_\ )

`0.13.0 <https://github.com/saltstack-formulas/packages-formula/compare/v0.12.0...v0.13.0>`_ (2021-03-26)
-------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **windows:** test using GitHub Actions (\ `e7bbefa <https://github.com/saltstack-formulas/packages-formula/commit/e7bbefa9f336f19cd7e673d49f6316291557b1e9>`_\ )
* enable Vagrant-based testing using GitHub Actions (\ `49fc85d <https://github.com/saltstack-formulas/packages-formula/commit/49fc85dfed0fbc0c3e35f20a45f22f2353810e99>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``kitchen-docker`` repo [skip ci] (\ `bd17a49 <https://github.com/saltstack-formulas/packages-formula/commit/bd17a49de0ec6ae8fb3b59a62c1226d27148bd94>`_\ )
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] (\ `c2e9774 <https://github.com/saltstack-formulas/packages-formula/commit/c2e9774dc7484ae10397c837b015ddd56a02c313>`_\ )
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] (\ `592e3d1 <https://github.com/saltstack-formulas/packages-formula/commit/592e3d1e4744e4d5b5ad88b1429f49bd62ed9f65>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** add ``Testing with Vagrant`` section (\ `d734d43 <https://github.com/saltstack-formulas/packages-formula/commit/d734d434c9e0a428cb484438e421c253e591b0d7>`_\ )

Features
^^^^^^^^


* **gentoo:** add support and CI (\ `534a1f6 <https://github.com/saltstack-formulas/packages-formula/commit/534a1f6f2bb11e52e1b9211427c00fc1030dd687>`_\ )

Tests
^^^^^


* **pkgs_spec:** fix ``rubocop`` violations (\ ``--enable-pending-cops``\ ) (\ `f7a6fcf <https://github.com/saltstack-formulas/packages-formula/commit/f7a6fcf707bb451a687bfbdbf33b74cace158254>`_\ )
* standardise use of ``share`` suite & ``_mapdata`` state [skip ci] (\ `79257d5 <https://github.com/saltstack-formulas/packages-formula/commit/79257d555a867fa23e4ceda93d008bf07869b3e7>`_\ )

`0.12.0 <https://github.com/saltstack-formulas/packages-formula/compare/v0.11.2...v0.12.0>`_ (2021-02-10)
-------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **commitlint:** ensure ``upstream/master`` uses main repo URL [skip ci] (\ `f893e2a <https://github.com/saltstack-formulas/packages-formula/commit/f893e2af43bf547d64cbbb3b06c27bef767c65ff>`_\ )
* **gitlab-ci:** add ``rubocop`` linter (with ``allow_failure``\ ) [skip ci] (\ `7dcb3d8 <https://github.com/saltstack-formulas/packages-formula/commit/7dcb3d86cda7d66ae5e17b0d587c74ffaad8e24d>`_\ )
* **pre-commit:** update hook for ``rubocop`` [skip ci] (\ `e36498e <https://github.com/saltstack-formulas/packages-formula/commit/e36498ed032a513ac924a4560c45be92b544a92a>`_\ )

Features
^^^^^^^^


* **centos-8:** added RedHat,CentOS and Oracle linux 8 support (\ `75526cc <https://github.com/saltstack-formulas/packages-formula/commit/75526cce61433a5b5edb5708618b380655e49de1>`_\ )

`0.11.2 <https://github.com/saltstack-formulas/packages-formula/compare/v0.11.1...v0.11.2>`_ (2020-12-16)
-------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gitlab-ci:** use GitLab CI as Travis CI replacement (\ `bdab6c1 <https://github.com/saltstack-formulas/packages-formula/commit/bdab6c1fceec694f3e1fedce4c0d0116735de20c>`_\ )

Tests
^^^^^


* **debian:** disable wanted snap testing (GitLab CI failure) [skip ci] (\ `4c047c4 <https://github.com/saltstack-formulas/packages-formula/commit/4c047c4e9f4875d86ef546ab8db830a7675251f7>`_\ )

`0.11.1 <https://github.com/saltstack-formulas/packages-formula/compare/v0.11.0...v0.11.1>`_ (2020-10-23)
-------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **states:** deploy packages only if required (\ `c9fe187 <https://github.com/saltstack-formulas/packages-formula/commit/c9fe187e1677cc2645d7ed479ab2d32749d38d30>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** use ``saltimages`` Docker Hub where available [skip ci] (\ `3a80123 <https://github.com/saltstack-formulas/packages-formula/commit/3a80123db0be1d8f291c606f61634fa2c8597c5e>`_\ )
* **pre-commit:** add to formula [skip ci] (\ `62e73fe <https://github.com/saltstack-formulas/packages-formula/commit/62e73fe14cab553603aab6d986199c05457ddcff>`_\ )
* **pre-commit:** enable/disable ``rstcheck`` as relevant [skip ci] (\ `22fa2e8 <https://github.com/saltstack-formulas/packages-formula/commit/22fa2e873719d296fab0a9af83c56732b158f275>`_\ )
* **pre-commit:** finalise ``rstcheck`` configuration [skip ci] (\ `d64b8d8 <https://github.com/saltstack-formulas/packages-formula/commit/d64b8d8b73fe3ed531c58b6dfdbf5f69201e5cf2>`_\ )

Tests
^^^^^


* **npm:** changed package to an existing one (\ `8a51ae5 <https://github.com/saltstack-formulas/packages-formula/commit/8a51ae5f559d5918f37bc0b3fc19da7cc3c88045>`_\ )
* **snaps:** disable classic snaps testing in debian (\ `bb60deb <https://github.com/saltstack-formulas/packages-formula/commit/bb60deb20bd7b5cb819f88a1257bba8343729731>`_\ )
* **ubuntu:** update for ``golang`` fix [skip ci] (\ `0226c88 <https://github.com/saltstack-formulas/packages-formula/commit/0226c880b8f5b452e6be710b5d1afd3c2d62a6f4>`_\ )

`0.11.0 <https://github.com/saltstack-formulas/packages-formula/compare/v0.10.2...v0.11.0>`_ (2020-06-01)
-------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** use latest pre-salted images (\ `bfcdd9c <https://github.com/saltstack-formulas/packages-formula/commit/bfcdd9cd591837723f8773005e0574815489b61a>`_\ )

Features
^^^^^^^^


* **fedora:** update for Python 3 (\ `0175a48 <https://github.com/saltstack-formulas/packages-formula/commit/0175a4811285c4a11f2fa3ac6e4507bc913c0a1d>`_\ )

`0.10.2 <https://github.com/saltstack-formulas/packages-formula/compare/v0.10.1...v0.10.2>`_ (2020-06-01)
-------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **pillar:** update ``node.pkg`` => ``node.package`` (\ `a6d3c98 <https://github.com/saltstack-formulas/packages-formula/commit/a6d3c98ae7cc3949feb060c95817250513536e8f>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** fix various issues inc. not rendering properly [skip ci] (\ `5701df0 <https://github.com/saltstack-formulas/packages-formula/commit/5701df06a9f60d1c3aa717d9a295655c14075223>`_\ )

`0.10.1 <https://github.com/saltstack-formulas/packages-formula/compare/v0.10.0...v0.10.1>`_ (2020-06-01)
-------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **python:** os default to python3 (\ `662a8d0 <https://github.com/saltstack-formulas/packages-formula/commit/662a8d092da7c0c6fe92ad6aed974e1c87c1f58d>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile.lock:** add to repo with updated ``Gemfile`` [skip ci] (\ `0628bf0 <https://github.com/saltstack-formulas/packages-formula/commit/0628bf029f0d80f8caab45c191ba28ef2e0af18a>`_\ )
* **kitchen+travis:** remove ``master-py2-arch-base-latest`` [skip ci] (\ `fb311a4 <https://github.com/saltstack-formulas/packages-formula/commit/fb311a42074acf58c3e9e39d6281d7faf766dede>`_\ )
* **travis:** add notifications => zulip [skip ci] (\ `57a1b14 <https://github.com/saltstack-formulas/packages-formula/commit/57a1b1449f7119206f4a7f634b61cb7a6724c494>`_\ )
* **workflows/commitlint:** add to repo [skip ci] (\ `9220ceb <https://github.com/saltstack-formulas/packages-formula/commit/9220ceb46b98628a8292e0f5f4cbf24164acc1d5>`_\ )

`0.10.0 <https://github.com/saltstack-formulas/packages-formula/compare/v0.9.0...v0.10.0>`_ (2020-03-30)
------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **chocolatey:** ensure states only run on Windows systems (\ `c1d680a <https://github.com/saltstack-formulas/packages-formula/commit/c1d680a9dd0863497ca004dcf41378fa0e5707f9>`_\ )
* **chocolatey:** verify chocolatey dicts are not empty (\ `385b223 <https://github.com/saltstack-formulas/packages-formula/commit/385b2238f4c8bc9389728cc6f90e320bc74b077c>`_\ )

Documentation
^^^^^^^^^^^^^


* **changelog:** merge old changelog into the new one (\ `070172d <https://github.com/saltstack-formulas/packages-formula/commit/070172db89f2762b11c73c8d149619ce1f197167>`_\ )

Features
^^^^^^^^


* **chocolatey:** add chocolatey management support (\ `c0c1195 <https://github.com/saltstack-formulas/packages-formula/commit/c0c119524228e30ed19f6fe8714d47b06915ff43>`_\ )

`0.9.0 <https://github.com/saltstack-formulas/packages-formula/compare/v0.8.0...v0.9.0>`_ (2020-03-28)
----------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **lint:** remove whitespace (\ `c03bb25 <https://github.com/saltstack-formulas/packages-formula/commit/c03bb255317716543c092431adf19cac2c0e7463>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** avoid using bootstrap for ``master`` instances [skip ci] (\ `d93e3d2 <https://github.com/saltstack-formulas/packages-formula/commit/d93e3d2584b2a5a0e65458b65a104f188568251b>`_\ )
* **kitchen:** reinstall ``udev`` since removed from pre-salted images (\ `a81f2dd <https://github.com/saltstack-formulas/packages-formula/commit/a81f2dd4b337ebe2a898ed8ed91e585e5f19b254>`_\ )

Features
^^^^^^^^


* **centos:** epel only needed for py-pip (\ `a0dd96d <https://github.com/saltstack-formulas/packages-formula/commit/a0dd96d6635306a675f89b2b607db4abc4096251>`_\ )

Tests
^^^^^


* **pillar:** disable ``dxpy`` on Ubuntu (works locally) (\ `155bdeb <https://github.com/saltstack-formulas/packages-formula/commit/155bdeb7b92d2d06a8d2147e21ad46dff9433aee>`_\ ), closes `verify#L4793-L4859 <https://github.com/verify/issues/L4793-L4859>`_
* **pillar:** update ``node`` version for Debian (\ `a9f120f <https://github.com/saltstack-formulas/packages-formula/commit/a9f120fa6aea35e96ff3d1ef2338bfaeb742afdf>`_\ )

`0.8.0 <https://github.com/saltstack-formulas/packages-formula/compare/v0.7.0...v0.8.0>`_ (2020-01-20)
----------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **archlinux:** fix test setup (\ `281846e <https://github.com/saltstack-formulas/packages-formula/commit/281846e79165872a17d8bd143f2f6b05e0b4da9b>`_\ )
* **centos:** fix tests (\ `a4d4d1d <https://github.com/saltstack-formulas/packages-formula/commit/a4d4d1dc734add260ca9b408a67754663c4636bb>`_\ )
* **gem:** fix ``invalid option: --no-rdoc`` & ``invalid option: --no-ri`` (\ `16c4213 <https://github.com/saltstack-formulas/packages-formula/commit/16c4213ab99204e01a040155782a9c158f64e2a9>`_\ )
* **golang:** ensure state runs (\ `0f992d9 <https://github.com/saltstack-formulas/packages-formula/commit/0f992d9c17b36b37078ac3866b9d2ec4240ebf0b>`_\ )
* **golang:** ensure using on ``ubuntu`` (\ `bd909bd <https://github.com/saltstack-formulas/packages-formula/commit/bd909bd1b63d5678431789980f4650dcb8246012>`_\ )
* **golang_spec.rb:** fix ``rubocop`` errors (\ `08340c8 <https://github.com/saltstack-formulas/packages-formula/commit/08340c857a54d67b8310a69558c45c37fd5600fb>`_\ )
* **node:** ensure using on ``debian`` (\ `eca4228 <https://github.com/saltstack-formulas/packages-formula/commit/eca4228906d119803a8e0bcf8c4eac33c1babeb3>`_\ )
* **pips.sls:** use ``tplroot`` instead of ``slspath`` (\ `a4e9311 <https://github.com/saltstack-formulas/packages-formula/commit/a4e9311a357808fd608c0e0de638ec3d4889235b>`_\ ), closes `/travis-ci.org/myii/packages-formula/jobs/636188022#L7867 <https://github.com//travis-ci.org/myii/packages-formula/jobs/636188022/issues/L7867>`_
* **rubocop:** add fixes using ``rubocop -a --safe`` (\ `1f72c40 <https://github.com/saltstack-formulas/packages-formula/commit/1f72c405de9dd01de1070e37d7d8cbdea41e66ad>`_\ )
* **rubocop:** fix remaining errors manually (\ `591d85a <https://github.com/saltstack-formulas/packages-formula/commit/591d85ab5725e6eb45122adebff6c66d894d86ec>`_\ )
* **salt-lint:** fix all errors (\ `83ed92b <https://github.com/saltstack-formulas/packages-formula/commit/83ed92bf64ab63ce2a3e0af3f93bb7bb16f87be7>`_\ )
* **yamllint:** fix all errors (\ `4176716 <https://github.com/saltstack-formulas/packages-formula/commit/4176716f7e45bf9023b29c79e2de4572b1a4e5ec>`_\ )

Code Refactoring
^^^^^^^^^^^^^^^^


* **map:** use ``config.get`` instead of ``pillar.get`` (\ `ca9bbd1 <https://github.com/saltstack-formulas/packages-formula/commit/ca9bbd15a12b2ff5df69fc2c17cb8ace12f095fe>`_\ )
* **pillar.amazonlinux:** shorten suite name to ``amazon`` (\ `593a6e5 <https://github.com/saltstack-formulas/packages-formula/commit/593a6e5e65557aaca186065314543aa17d13d8f1>`_\ )
* **test_pillars:** rename to make accessible to ``yamllint`` (\ `033ff44 <https://github.com/saltstack-formulas/packages-formula/commit/033ff4453f7c2a3cc23785425b10705ecb6fbaa9>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **inspec:** fix Debian tests (\ `98c6d2c <https://github.com/saltstack-formulas/packages-formula/commit/98c6d2c9bad3e0c4caad51fd27bde3192cf6df0f>`_\ )
* **inspec:** removing useless inspec tests (\ `3615785 <https://github.com/saltstack-formulas/packages-formula/commit/3615785e52c671d32fe0b71fd784f25e3beff5d1>`_\ )
* **kitchen:** fix tests with a minimal coverage (\ `288f893 <https://github.com/saltstack-formulas/packages-formula/commit/288f8936528c9dc33af519314aa36ea69747588b>`_\ )
* **kitchen+inspec:** add Amazonlinux test suite (\ `edb0d73 <https://github.com/saltstack-formulas/packages-formula/commit/edb0d73ffe0c2a02d3b3d69149ce1edd6b65634e>`_\ )
* **kitchen+inspec:** add Centos test suite (\ `d320ccd <https://github.com/saltstack-formulas/packages-formula/commit/d320ccd36b1d1f0a0d70a16a81df7cf0072a1d8c>`_\ )
* **kitchen+inspec:** add fedora30 and fedora29 tests suites (\ `e41117c <https://github.com/saltstack-formulas/packages-formula/commit/e41117c34b6f314b7f10ee5a661985c6cc004018>`_\ )
* **kitchen+inspec:** add initial support for opensuse (\ `58b1209 <https://github.com/saltstack-formulas/packages-formula/commit/58b1209d9a67d59c3b6a2df4b975c2b4690535af>`_\ )
* **kitchen+inspec:** add Ubuntu test suite (\ `39ba77d <https://github.com/saltstack-formulas/packages-formula/commit/39ba77d04443abd4d543337ac9cf1e8ae05d5207>`_\ )
* **pillars:** use one retry to prevent excessive slow-down in Travis (\ `48ae3c9 <https://github.com/saltstack-formulas/packages-formula/commit/48ae3c98fdcc9e6117efb006334e2ac93afc3d40>`_\ )

Features
^^^^^^^^


* **semantic-release:** update for this formula (\ `1755f76 <https://github.com/saltstack-formulas/packages-formula/commit/1755f76fde53a8af1641deda393bd8fad3b40230>`_\ )
* implementing semantic release (\ `17b4331 <https://github.com/saltstack-formulas/packages-formula/commit/17b433126b6e5f7eb5cbfb93558657262e41699b>`_\ )
* **golang:** add go package management (\ `284b240 <https://github.com/saltstack-formulas/packages-formula/commit/284b240c331a109937dbfceebcb83b44f98e18bf>`_\ )
* **internet:** add retries for internet dependent states (\ `7660dbd <https://github.com/saltstack-formulas/packages-formula/commit/7660dbd76f092fc90635804afe5af32cdad66755>`_\ )

Tests
^^^^^


* **arch:** test initial configuration (\ `702e8c3 <https://github.com/saltstack-formulas/packages-formula/commit/702e8c32bfaa5f7fc3695fd6421f9c47c0edc057>`_\ )
* **fedora:** merge fedora test suites and pillars (\ `89911dc <https://github.com/saltstack-formulas/packages-formula/commit/89911dc9c8aec1ecd83755f5bf6d1deaf216d349>`_\ )
* **golang:** basic integrtaion test & tweaks (\ `6c3de22 <https://github.com/saltstack-formulas/packages-formula/commit/6c3de2231d136c9d9eb57e232523d0a360ff54f0>`_\ )
* **pillar:** use single ubuntu pillar (\ `c69cb5a <https://github.com/saltstack-formulas/packages-formula/commit/c69cb5a792186a8a1600987087389229ddf7a67a>`_\ )
* **pillar:** use specific pillar for ``debian`` (\ `adf1523 <https://github.com/saltstack-formulas/packages-formula/commit/adf1523e08bfeff8d635052a8942b48326e507cb>`_\ )
* fix existing tests (\ `8e75c9d <https://github.com/saltstack-formulas/packages-formula/commit/8e75c9d5c0c4af5fe4e56ecfcdfcc7ea7486d4dc>`_\ )

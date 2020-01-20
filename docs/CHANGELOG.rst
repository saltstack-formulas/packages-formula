
Changelog
=========

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

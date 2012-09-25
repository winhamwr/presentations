!SLIDE fullscreen

<img src="more_dots.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.wow-pvp-pve.com/wowpvp/1121-DoTs-and-Resilience.html">
www.wow-pvp-pve.com</a>
</div>

!SLIDE bullets incremental
# disclaimer

* Django testrunner good enough
* Opinionated is more fun
* Lighting talk == less nuance
* Seriously though, Nose is awesome

!SLIDE bullets incremental
# Django testrunner fail

* Re-invented wheel
* Questionable decisions
* Bugs
* Fragments python testing community

!SLIDE bullets incremental
# Django testrunner: Wheels

* `LiveServerTestCase`
* xunit output? Custom testrunner
* Broken test selection (for a bit)
* Define a `suite()`?

!SLIDE bullets incremental
# Django testrunner: Design

* Everything in `tests.py`
* Encourages doctests
* Monolithic testrunner
* Java style

!SLIDE bullets incremental
# Django testrunner: Bugs

* Truncate [before run](https://docs.djangoproject.com/en/dev/releases/1.5/#database-flushing-in-django-test-transactiontestcase)?
* Implicit [DB sequence reset](https://docs.djangoproject.com/en/dev/releases/1.5/#no-more-implict-db-sequences-reset), sometimes
* Order [guarantee](https://docs.djangoproject.com/en/dev/releases/1.5/#ordering-of-tests), causing coupling

!SLIDE bullets incremental
# Nose is Awesome

* General python testing
* Compatible with UnitTest
* Massive plugin ecosystem
* Ballertastic test discovery

!SLIDE bullets incremental
# Nose: Useful all over

* Bring your own plugins
* Use your existing test suite
* Non-Django guys are people too

!SLIDE bullets incremental
# Nose: Builtin Awesome

* Test package/module/class
* No cruft
* Generator tests!
* setup/teardown at multiple levels

!SLIDE bullets incremental
# Nose: Builtin Plugins

* Attrib: Tag/select tests
* Cover: Coverage!
* Debug: PDB
* Multiprocess: Parallel tests

!SLIDE bullets incremental
# Nose: Builtin Plugins

* Testid: Easy-reruns
* Xunit: CI Integration
* Logcapture + Capture: log/stdout

!SLIDE bullets incremental
# Nose: 3rd Party Plugins!

* Incremental progress
* Every framework ever
* Editor integrations
* Performance

!SLIDE bullets incremental
# Nose: Plugin goodies

* Hooks all over
* Configuration all over
* Plugins all over (the interwebs)

!SLIDE bullets incremental
# Use Nose + Django

* Several options
* All good
* Trade-offs

!SLIDE bullets incremental
# django-nose and nosedjango

* Fixture order optimization
* Test discovery
* Nose!

!SLIDE bullets incremental
# [django-nose](https://github.com/jbalogh/django-nose)

* Easy usage from `manage.py`
* Re-use previous DB connections
* Better support?

!SLIDE bullets incremental
# [nosedjango](https://github.com/nosedjango/nosedjango)

* Multiprocess!
* Plugin system
* Selenium, file storage, sqlite, celery plugins

!SLIDE bullets incremental
# Pick one!

* Both get awesome Nose plugins
* Will you use Nosedjango plugins?
* Does Multiprocess help you?

!SLIDE bullets incremental
# Django 1.5 redemption

* Moved to UnitTest2 (improvement)
* Fixing truncate and DB sequence reset
* No order guarantee
* Per-test calling (since 1.0)

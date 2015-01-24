!SLIDE subsection

# Testing Matters

!SLIDE fullscreen center

<img src="performance_matters.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.cloudreviews.com/blog/web-performance-optimization-part-1">
cloudreviews.com</a>
</div>

!SLIDE bullets
# Today

* I'll show you how to write and run tests
* Randy- How to test effectively
* Randy- How to test difficult things
* Rob- Keep things fast and scalable
* Calvin- Run those awesome tests

!SLIDE subsection
# Write Tests!

!SLIDE bullets
# you'll get...

* Better code design
* Quicker implementation to working code
* Refactoring with abandon
* Fearless updates

!SLIDE subsection
# Good Tools Matter

!SLIDE bullets
# Master testers can...

* Eliminate boilerplate
* Write maintainable tests (tests are code)
* Pick the right tool

!SLIDE subsection
# Part 1: Pythonic Testing

!SLIDE code fullscreen

    @@@ python
    # add_one.py
    def add_one(x):
        return x + 1

!SLIDE bullets
# Zen of python

* Simple is better than complex.
* Flat is better than nested.

!SLIDE code fullscreen

    @@@ python
	import unittest
	from add_one import add_one

	class AddOneTest(unittest.TestCase):
		def test_negative_one(self):
			self.assertEqual(add_one(-1), 0)

	if __name__ == '__main__':
		unittest.main()

!SLIDE subsection
## Is this Java?

!SLIDE subsection
## nose or pytest!

!SLIDE code fullscreen

    @@@ python
    # test.py
	from add_one import add_one

    def test_negative_one():
        assert add_one(-1) == 0

!SLIDE bullets
## Complex tests

* Test fixtures
* Test cleanup
* Stdout
* Filesystem

!SLIDE subsection
## Example: Easy filesystem tests

!SLIDE code fullscreen

    @@@ python
    # test_tmpdir.py
    def test_needsfiles(tmpdir):
        print (tmpdir)
        assert 0


!SLIDE subsection
# History of python testing

!SLIDE subsection
## In the beginning, unittest

!SLIDE fullscreen center

<img src="sad_guy.png">
<br />

!SLIDE bullets
## History: Rise of nose

* pytest first, easy test discovery
* ~2007 nose is easy to install
* Works with unittest for free
* More extensive plugin system

!SLIDE bullets
## History: pytest resurgence

* Feature parity since 2009-2011
* Better documentation
* Better parameterized fixtures
* Both good plugin ecosystems

!SLIDE bullets
# Installation

* `$ virtualenv tfp`
* `$ pip install nose pytest`

!SLIDE subsection
# Why you should use them

!SLIDE subsection
# Better: Test discovery and running

!SLIDE code fullscreen

    @@@ python
	import unittest

	if __name__ == '__main__':
		unittest.main()

!SLIDE bullets
## They run everything

* unittest cases
* `test_FOO` modules
* `test` functions

!SLIDE bullets
## Discovery options: 1

* `$ nosetests only_test_this.py`
* `$ nosetests test.module`
* `$ nosetests another.test:TestCase.test_method`
* `$ nosetests a.test:TestCase`
* `$ nosetests /path/to/test/file.py:test_function`

!SLIDE bullets
## Discovery options: 2

* `$ py.test only_test_this.py`
* `$ nosetests`
* `$ py.test`

!SLIDE subsection
# Runs doctests

!SLIDE code fullscreen

    @@@ python
    # add_one.py
    def add_one(x):
        """
        >>> add_one(-1)
        0
        """
        return x + 1

!SLIDE subsection
# Test type: class

!SLIDE code fullscreen

    @@@ python
	from add_one import add_one

	class AddOneTest:
		def test_negative_one(self):
			assert add_one(-1) == 0

!SLIDE subsection
# Test type: generator

!SLIDE code fullscreen

    @@@ python
	def test_evens():
		for i in range(0, 5):
			yield check_even, i, i*3

	def check_even(n, nn):
		assert n % 2 == 0 or nn % 2 == 0

!SLIDE bullets
# Setup/Teardown types

* Module
* Class
* Function (decorators)

!SLIDE code fullscreen

    @@@ python
	from add_one import add_one

	class AddOneTest:
        def set_up(self):
            # Do work

		def test_negative_one(self):
			assert add_one(-1) == 0

!SLIDE subsection
# Configuration: nose

!SLIDE code fullscreen

	@@@ ini
	# setup.cfg, .noserc or nose.cfg
	[nosetests]
	verbosity=3
	with-doctest=1

!SLIDE subsection
# Configuration: pytest

!SLIDE code fullscreen

	@@@ ini
	# pytest.ini, tox.ini or setup.cfg
	[pytest]
	python_files=*.py
	norecursedirs = _build

!SLIDE subsection
# pytest: Fixture injection

* Examples from [Danny Greenfield](http://www.pydanny.com/pytest-no-boilerplate-testing-2.html)

!SLIDE code fullscreen

    @@@ python
	# test_fixtures.py
	from pytest import fixture

	@fixture  # Registering this function as a fixture.
	def complex_data():
		# Creating test data entirely in this function to isolate it
		#   from the rest of this module.
		class DataTypes(object):
			string = str
			list = list
		return DataTypes()

	def test_types(complex_data): # fixture is passed as an argument
		assert isinstance("Elephant", complex_data.string)
		assert isinstance([5, 10, 15], complex_data.list)

!SLIDE subsection
# pytest: Tests for tests

!SLIDE code fullscreen

    @@@ python
	# test_fixtures.py
	# note: this version of test_fixtures.py is built off the previous example

	def test_complex_data(complex_data):
		assert isinstance(complex_data, object)
		assert complex_data.string == str
		assert complex_data.list == list

!SLIDE bullets
# Debugging: PDB on failures

* `$ nosetests --pdb`
* `$ py.test --pdb`

!SLIDE bullets
# Debugging: PDB when you want

    @@@ python
	from nose.tools import set_trace
    from pytest import set_trace

    ...
    set_trace()

!SLIDE subsection
# Plugins

!SLIDE bullets
# Plugins: For (almost) everything

* Your favorite web framework
* Code coverage
* Tox
* Parallel test running
* xUnit output

!SLIDE bullets
# Plugins: Sources

* [pytest-plugis](http://pytest-plugs.herokuapp.com/)
* [nose builtin](http://nose.readthedocs.org/en/latest/plugins/builtin.html)
* [nose 3rd party](https://nose-plugins.jottit.com/)

!SLIDE bullets
# Plugin: Tox

* Test combinations of things
* Different python versions
* Different requirements

!SLIDE bullets
# Plugin: Parallel Test Running

* `$ nosetests --processes=2`
* `$ pip install pytest-xdist`
* `$ py.test -n 2`

!SLIDE bullets
# Plugin: Shared-nothing Distributed Test Running

* [distributed-nose](https://github.com/PolicyStat/distributed-nose)
* `$ export NOSE_NODES=2;`
* `$ export NOSE_NODE_NUMBER=1;`
* `$ nosetests long_test_suite`

!SLIDE bullets
# Plugin: xUnit output

* `$ py.test --junitxml=path`
* `$ nosetests --with-xunit`

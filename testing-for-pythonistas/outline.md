# Why Testing Tools Are So Important

## Testing Is Very Important

* Great testing lineup today
* I'll tell you how to write and run tests
* Randy will teach you what tests to write, how to test in teams and how to get started when your project has no tests.
* Randy will then help you with some of the areas where testing is the most difficult and teach you about mocks and other advanced testing techniques.
* Now that you know how to make sure your stuff works, Rob will show you how to make sure it stays fast and scales
* Calvin will show you how to make sure all of these tests are running all the time so that you always get their benefit.


### We will convince you to test

* Better code design with better decoupling and interfaces
* Faster to working code, for complex code
* Higher-quality code for non-trivial systems
* Ability to refactor at will
* Code without fear
* Learning curve, like anything else

### Good tools make all the difference

* Being a master of your tools, very important
* Eliminate repetition
* Writing maintainable tests, like maintainable code
* Right tool for the job

## Pythonic Testing

* Zen of python
* Java unit test
  * example
* No-boilerplate nose test
  * example
* Plugins
  * example, test skipping

### Nose and py.test history

* py.test first
* nose corrected some installation problems and worked with unittest out of the box
* nose had more extensive plugin system hooks
* py.test has caught back up since 2012-2013
* py.test better documentation
* py.test parameterized fixtures
* basically full feature parity
* I use nose most, so biased


### Features

#### Test discovery and running

* Not just unittest, but finds unittest
* `test_` modules, walks directories
  * example
* doctests
  * example
* Take file paths and module paths
  * example
* Kyle's autocomplete module

```bash
$ nosetests project
```
`

#### function, class, generator

* function
  * example
* class
  * example
* generator
  * example

#### Setup, teardown

* Module
* Class
* Function


## Your First Test

### Installation

* virtualenv, pip, hitchhikers guide

### Minimal test

* function with assert
  * example
* fnctio with assert helpers
  * example
* class example
* unittest
  * example

## Using Plugins

* django
* coverage
* `<your framework>`
* `<your backend service>`
* [pytest-plugs](http://pytest-plugs.herokuapp.com/)
* [nose builtin](http://nose.readthedocs.org/en/latest/plugins/builtin.html)
* [nose 3rd party](https://nose-plugins.jottit.com/)

### debugging with pdb

### Conditional skipping

* Database-specific tests
* Slow versus fast tests

### Xunit output

* For continuous integration

### Parallelize Things
* Multiprocess
  * example
* [distributed-nose](https://github.com/PolicyStat/distributed-nose)
  * example



## Writing Plugins

### Example: Testing Sphinx

## nose2

* Rewrite based on unittest2
* Aims to be plugins for use with unittest2
* Sane plugin API
* Not plugin feature parity, incompatible plugins


!SLIDE
# ci.neckbeard #

* easy compared to process, but necessary
* this part is a technical how-to

!SLIDE bullets incremental
# 15 minutes to Jenkins#

1. launch your EC2 instance
2. use [Chef](http://wiki.opscode.com/display/chef/Home) to configure [Jenkins](http://jenkins-ci.org/)
3. configure [pyflakes](http://pypi.python.org/pypi/pyflakes) and [PEP8](http://pypi.python.org/pypi/pep8)
4. configure unittests with [NoseDjango](https://github.com/nosedjango/nosedjango)

!SLIDE
# bonus: extreme feedback #

!SLIDE bullets incremental
# tech choices #

* no reason to choose a CI server other than Jenkins
* Don't go looking for a problem
* Chef is awesome, but Puppet is also good.
* littlechef lowers Chef entry cost. keeps you sane
* Infrastructure should be code.

!SLIDE
# caveats #

* lots of ways to host Jenkins
* chose EC2, Ubuntu, Chef, [littlechef](https://github.com/tobami/littlechef)
* result of time constraints (pull requests welcome)

!SLIDE bullets
# 15 minutes to Jenkins #

1. **launch your EC2 instance**
2. use Chef to configure Jenkins
3. configure pyflakes and PEP8
4. configure unittests with NoseDjango

!SLIDE bullets incremental
# 1. launch an ec2 instance #

* sign up for aws account
* launch a c1.medium 32-bit non-ebs [Ubuntu 10.04 ami](http://uec-images.ubuntu.com/releases/10.04/release/) instance
* Real Neckbeards would use the API, but I used the console
* optionally attach and mount an EBS vol

!SLIDE bullets
# 15 minutes to Jenkins #

1. launch your EC2 instance
2. **use Chef to configure Jenkins**
3. configure pyflakes and PEP8
4. configure unittests with NoseDjango

!SLIDE
# example project *

* following examples use a forked [TDD Django Tutorial repo](https://github.com/winhamwr/Test-Driven-Django-Tutorial)
* comes with [littlechef](https://github.com/tobami/littlechef) configured
* uses Fabric + chef solo for consistent infrastructure

!SLIDE bullets incremental
# 2. use Chef to configure Jenkins #

21. grab our sample project
22. install python requirements in a new virtualenv
23. configure ssh authentication to your ec2 node
24. run littlechef `fix` and watch the magick

!SLIDE
# interlude #

* Ruby sucks sometimes
* need to install [Chef](http://wiki.opscode.com/display/chef/Workstation+Setup+for+Debian+and+Ubuntu) as of a few weeks ago
* install rubygems
* then: 
	
	$ gem install chef --no-ri --no-rdoc

!SLIDE commandline incremental
# 2.1 grab our sample project #

	$ gem install chef --no-ri --no-rdoc
	$ cd ~/workspace/zero_to_ci
	$ git clone https://winhamwr@github.com/winhamwr/Test-Driven-Django-Tutorial.git
	$ cd Test-Driven-Django-Tutorial
	$ git submodule init && git submodule update
	$ cd Test-Driven-Django-Tutorial/infrastructure

!SLIDE commandline incremental
# 2.2 install python requirements  

	$ mkvirtualenv zero-to-ci
	$ pip install -r requirements.txt

!SLIDE commandline
# 2.3 configure ssh auth #

* copy `infrastructure/ssh_config.example` to `~/.ssh/config`

	$ cat ssh_config.example >> ~/.ssh/config

* Change the `HostName` to your ec2 instances public DNS
* Change the `IdentityFile` path to point at the ec2 private key you used

!SLIDE commandline incremental
# 2.4 run littlechef #

* our sample project has a z2ci-jenkins `node` and `role` configured
* this tells littlechef, in combo with your `.ssh/config`, what to install:

	$ fix node:z2ci-jenkins deploy_chef
	$ fix node:z2ci-jenkins

!SLIDE bullets
# 15 minutes to Jenkins #

1. launch your EC2 instance
2. use Chef to configure Jenkins
3. **configure pyflakes and PEP8**
4. configure unittests with NoseDjango

!SLIDE bullets incremental
# 3. configure pyflakes and PEP8 #

* we used the [chef-jenkins](https://github.com/fnichol/chef-jenkins) cookbook to create the jobs
* used jenkins configuration xml files
* checks out the project on every commit and fails if it fails

!SLIDE bullets
# 15 minutes to Jenkins #

1. launch your EC2 instance
2. use Chef to configure Jenkins
3. configure pyflakes and PEP8**
4. **configure unittests with NoseDjango**

!SLIDE bullets incremental
# 4. configure unittests with NoseDjango #

* used chef-jenkins for this
* NoseDjango lets you use Nose to run Django tests
* Nose is awesome
* multiprocess, xunit plugins, coverage plugins, pdb on failure, etc

!SLIDE bullets incremental
# your project isn't tdd-django-tutorial #

* your project will differ
* tons of great tutorials on fixing any tech problem you find

!SLIDE bullets incremental
# things you'll need to change #

* need to give jenkins access to your repo
* probably need to install additional system packages (eg. PIL)
* need to change path to your project's `pip` requirements file
* other things?

!SLIDE bullets incremental
# reminder re:oceans #

* don't boil them
* if unittests aren't behaving, just use pyflakes for a while
* pyflakes == 1000 errors?
* Set the job to pass at 990 errors then fix 11



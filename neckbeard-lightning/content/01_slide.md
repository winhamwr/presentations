!SLIDE bullets
# Good production deploys are hard

* Should be *one* command run by a *developer*
* Should be *fast* and embrace cloud ephemerality
* Shouldn't let you break things
* Shouldn't interrupt customers

!SLIDE fullscreen

<img src="neckbeard.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://memegenerator.net/Richard-Stallman/images/new/alltime/page/2">
memegenerator.net</a>
</div>

!SLIDE bullets incremental
# Bad production deploys are easy

* Oops. Pypi was down. Users get 500s
* Oops. An EC2 instance poofed. Users get 500s
* Oops. I forgot a step on the wiki. Users get 500s
* Oops. Rotated out the only working node. Users get 500s

!SLIDE fullscreen

<img src="deploy_disaster.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://memegenerator.net/instance/36234685">
memegenerator.net</a>
</div>

!SLIDE bullets
# Folks who don't care

* (quality) Large companies with devops teams

!SLIDE fullscreen

<img src="smiling_google_dude.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.theverge.com/2013/2/13/3986794/vince-vaughn-and-owen-wilson-go-to-google-in-the-trailer-for-the-internship">
www.theverge.com</a>
</div>

!SLIDE bullets
# Folks who don't care

* Google, LinkedIn, Facebook, Amazon.com, Netflix, etc
* Already solved this
* Deployinator, Borg, Asgard, Mesos, Sekrits

!SLIDE bullets
# Folks who don't care

* Deploying known-working 3rd-party apps (Wordpress)
* Hobby projects
* Deploy once per month to your one co-lo server
* On a PaaS and very happy

!SLIDE bullets
# You should care

* You want to practice continuous delivery
* Your customers care about your thing
* Your deploy takes more than *one* manual step

!SLIDE bullets
# You should care

* You want to take advantage of dynamic scaling
* You are scared of deployment
* Your disaster recovery is different than your deploy

!SLIDE bullets
# Tools solving similar problems

* Orchestration
* "Pull-based" Configuration Management

!SLIDE fullscreen

<img src="square_peg.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://fingercandymedia.com/5104-square-peg-in-a-round-hole-social-media">
fingercandymedia.com</a>
</div>

!SLIDE bullets
# Orchestration (PaaS-ish)

* Juju, Stackato, Cloud Foundry, Open Shift etc etc
* Partial deploys?
* Manage EC2 nodes?
* Detect that I'm breaking things?
* Own my backing services?

!SLIDE bullets
# "Pull-based" Configuration Management

* Chef Server, Puppet, Salt Stack
* Who launches and terminates my nodes?
* Partial deploys?
* Slow rollouts, maintaining redundancy?
* RDS? External backing services?

!SLIDE bullets
# Re-inventing Wheels

* We're all writing the same "glue" code!

!SLIDE fullscreen

<img src="reinvented_wheel.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.blueinkalchemy.com/2010/10/18/reinventing-the-wheel/">
www.blueinkalchemy.com</a>
</div>

!SLIDE bullets
# You've probably already done this!

* There exist awesome FOSS tools for parts of the problem
* Fabric + Chef + Boto + Bash + ...
* Congrats, you're now a one-person Heroku
* Good luck competing on developer happiness

!SLIDE fullscreen

<img src="with_our_powers_combined.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://bygeeksforgeeks.blogspot.com/2012/10/flashback-friday-captain-planet-and_13.html">
bygeeksforgeeks.blogspot.com</a>
</div>

!SLIDE bullets
# With our powers combined

* Piggyback on existing projects
* Tie them together
* Agree on strong interfaces for extensibility

!SLIDE bullets
# Help Me

* [Neckbeard](https://github.com/winhamwr/neckbeard)
* Open-sourcing what I have
* Pluggable interfaces for sharing!
* Fabric + `IaaS` + `datastore` + `provisioner` + `orchestration`

!SLIDE bullets
# The Future

1. `$ neckbeard up`
2. Launch/Configure cloud resources
3. Datacenter-aware, staged, zero-downtime deploy
4. Deployment immune system
5. Hooks for monitoring, logging, reporting, snowflakes, etc

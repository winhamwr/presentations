!SLIDE fullscreen

<img src="neckbeard.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.wow-pvp-pve.com/wowpvp/1121-DoTs-and-Resilience.html">
www.wow-pvp-pve.com</a>
</div>

!SLIDE bullets
# Good production deploys are hard

* Should be *one* command run by a developer
* Should be *fast*
* Should embrace cloud ephemerality
* Shouldn't let you break things
* Shouldn't interrupt customers

!SLIDE fullscreen

<img src="deploy_disaster.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.wow-pvp-pve.com/wowpvp/1121-DoTs-and-Resilience.html">
www.wow-pvp-pve.com</a>
</div>

!SLIDE bullets incremental
# Bad production deploys are easy

* Oops. Pypi was down. Users get 500s
* Oops. An EC2 instance poofed. Users get 500s
* Oops. I forgot a step on the wiki. Users get 500s
* Oops. Rotated out the only working node. Users get 500s
* Oops. Worked on my machine. Users get 500s

!SLIDE fullscreen

<img src="smiling_google_dude.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.wow-pvp-pve.com/wowpvp/1121-DoTs-and-Resilience.html">
www.wow-pvp-pve.com</a>
</div>

!SLIDE bullets
# Folks who don't care

* (quality) Large companies with devops teams
* Google, LinkedIn, Facebook, Amazon.com, Netflix
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
* Your disaster recovery is different than your deploy
* You want to take advantage of dynamic scaling

!SLIDE fullscreen

<img src="square_peg_kid.gif">
<br />
<div class="photo-credits">
        photo: <a href="http://www.wow-pvp-pve.com/wowpvp/1121-DoTs-and-Resilience.html">
www.wow-pvp-pve.com</a>
</div>

!SLIDE bullets
# Tools solving similar problems

* Orchestration: Juju, Stackato, Cloud Foundry
* Partial deploys?
* Manage EC2 nodes?
* Detects that I'm breaking things?
* Own my backing services?

!SLIDE bullets
# Tools solving similar problems

* "Pull" config management: Chef Server, Puppet, Salt Stack
* Who launches and terminates my nodes?
* Partial deploys?
* Slow rollouts, maintaining redundancy?
* RDS? External backing services?

!SLIDE fullscreen

<img src="re_invented_wheel.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.wow-pvp-pve.com/wowpvp/1121-DoTs-and-Resilience.html">
www.wow-pvp-pve.com</a>
</div>

!SLIDE bullets incremental
# You've probably already done this!

* There exist awesome FOSS tools for parts of the problem
* Fabric + Chef + Boto + Bash + ...
* Congrats, you're now a one-person Heroku
* Good luck competing on developer happiness

!SLIDE fullscreen

<img src="with_our_powers_combined.jpg">
<br />
<div class="photo-credits">
        photo: <a href="http://www.wow-pvp-pve.com/wowpvp/1121-DoTs-and-Resilience.html">
www.wow-pvp-pve.com</a>
</div>

!SLIDE bullets
# With our powers combined

* Piggyback on existing projects
* Tie them together
* Agree on strong interfaces for extensibility

!SLIDE bullets
# Help Me

* Neckbeard
* Open-sourcing what I have
* Strongly Heroku-convergent interface
* Fabric + Boto + SimpleDB + LittleChef + Chef-solo

!SLIDE bullets
# The Future

* `$ neckbeard up`
* Find existing nodes/services and launch/configure new ones (with data)
* Understand AZ's, rotate nodes out of the load balancer, deploy to them
* If they're not healthy, stop! Needs human intervention
* Hooks for monitoring, logging, reporting, etc

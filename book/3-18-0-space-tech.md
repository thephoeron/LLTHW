<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Space-Tech</li>
</ol>

## Chapter 3.18

# Space-Tech

> "Relevant quote..."
> <footer>Source</footer>

All software has bugs in it---it's a part of life; not all bugs are actual mistakes, per se, sometimes they can be no more than an application of the wrong algorithm to a given problem, which provides an apparently correct answer say 99% of the time, but then produces something completely wrong in that last 1% of the cases.  Here, on Earth, bugs in software can cause significant problems as it is, which is why so much time and effort is spent on QA and software updates; but imagine how much trouble a bug could be in a Probe, Satellite, or Space-Craft, where a technical support and development team can't directly access the hardware, and in dealing with the vast distances of space, have so much lag between any event and the notification of it.

Traditional software development lifecycles and technologies are inherently at a disadvantage in Space Tech, an industry where you can't afford to make any mistakes.  One of the most important features needed in any space-based platform is the ability to immediately get inside the running application, identify a bug and fix it while the application is running.  *Lisp was designed to do this*.

Now, imagine the relative convenience of a space-craft where all the systems are programmed in Lisp, and are thus live hackable; astronauts are already highly trained, highly intelligent and resourceful individuals who can cope with the stresses of life in space---and it would not be much of a stretch to add programming to their list of necessary skills.  If they had the option to control all systems from a REPL, extend, test, and fix mission critical software interactively, on an as-needed basis, they would be significantly better equipped to handle any of the many issues that can arise in space, in a much more timely fashion than mission control on Earth can respond.  Those precious seconds of lag in communication between Earth and a space-craft can mean the difference between mission failure and success.

---

Discuss the NASA story of live-hacking a space probe while in transit, as mentioned by Peter Seibel in PCL.  Find original sources.

Overview of rocket propulsion, motion in a vacuum, microgravity, astrophysics, etc.

Design an idealized satellite or probe, with basic AI that can be overridden by a controller on Earth.

Implement a simulator that tests this probe in space-like conditions.  Bonus points for 3D simulation?

<ul class="pager">
  <li class="previous"><a href="/book/3-17-0-robotics/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-19-0-neurotech/">Next &raquo;</a><li>
</ul>

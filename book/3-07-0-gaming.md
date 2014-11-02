<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">OpenGL, SDL, and 3D Game Development</li>
</ol>

## Chapter 3.7

# OpenGL, SDL, and 3D Game Development

> "For modern man one of the most troubling aspects of eternity lies in getting used to the slippery quality of time."
> <footer>Robert A. Heinlein, <em>Job: A Comedy of Justice</em></footer>

Game development is a highly competitive industry; there are a lot of development platforms and technology-stacks available for the would-be game developer, and all of them have their own particular strengths and advantages.  If you want an out of the box solution, and are working with 3D artists to create your assets, you will get everything you need with popular frameworks such as the Unreal Engine, or Unity3D; but creating a commercial platformer is not the only reason developers get into game development.  Sometimes, you just want to create something for yourself and your friends---and you want the satisfaction of knowing you did it your own way.

Game development in Lisp has many options, and offers the unique strength that you can program everything---even the graphics and audio.  You don't need to work with a team of asset creators and audio engineers, you can do everything yourself with pure Lisp code.  Naturally, game development on any platform is still a lot of work---but building a 3D platformer in 100% Lisp source code requires no more effort than a game built in Unity3D, and as a programmer, you may find the pure source code approach more intuitive.  That being said, Lisp doesn't stop you from working with a 3D artist to create your assets; you can adopt the approach that works best for you.

To create the immersive worlds of today's platformer games, you will have to start thinking in terms of spatial geometry and perspective.  The goal is not to programmatically recreate the material world from the atomic level up---the goal is to create the *effect* of the material world with adequate simulations, using physics and animation to create your scenes.  Game development is very math-heavy, but if you paid close attention in the preceding material from Part Two of this book, you'll have all the tools you need.

In this chapter, we will be modelling a basic 3+1n Spacetime, to get you thinking in terms of the environments you will be building for your games, and transforming objects within them over time; reviewing the available libraries in Quicklisp for 3D game development; and creating a couple simple games---first, programmatically with procedurally generated environments and assets, and second, using assets created with the open-source 3D artwork platform, Blender.  As an extra credit exercise, we will also be writing a bridge to the Oculus Rift VR headset, so that you can create fully immersive virtual reality games.

<ul class="pager">
  <li class="previous"><a href="/book/3-06-0-graphics/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-08-0-audio/">Next &raquo;</a><li>
</ul>

<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: An Improved Text Adventure Engine</li>
</ol>

## Chapter 2.10 --- Extra Credit

# An Improved Text Adventure Engine

> "Oratory is a null program."
> <footer>Robert A. Heinlein, <em>The Moon Is a Harsh Mistress</em></footer>

You've been working hard, and now it's time to reward yourself with some more fun!  We will now take everything that we've learned so far and put it together to make a Game Engine---one which you can use to create any text-based adventure you like, just by filling out a plain-text game script file.  This engine should also be general enough so that it can be extended later to include graphics and animation, but still lets you create your games with plain text files.

Let's consider a few aspects of games that make them the most fun.  First of all, the game world should be comprehensively interactive.  Players expect to be able to interact with everything they see as they journey through your game world---and they like to be rewarded for their curiosity.  This point holds for characters, objects, and rooms---so, as we are implementing our game engine, we need to implement it in such a way that everything is interactive, and the game world is built dynamically from the objects, characters, and rooms you provide, without you having to manually, and redundantly, describe each room that is entered by a player.  This kind of approach will also help you manage your environment better, since whenever an object is added to a room, or an NPC or enemy character enters a room, the player can experience these changes to the game world effectively in real-time.  Players also like when a game keeps track of their journey through the game world, and notifies them of changes since the last time they were there.  It is also a nice touch when the game differentiates between changes that the player made versus changes that other characters made to the environment.  Players also like puzzles to solve, and various tests of their skills and progress---these challenges typically should scale to their ability, as well as scaling against their progress.  Naturally, Players also expect NPCs to have at least a basic AI---so NPCs and enemies should be able to do anything the player can do in the game world, and come to these decisions on their own, or in response to player actions. Lastly, players also like to know that their progress can be saved, so that if they need to stop playing the game and get back to work, or a challenge bests them and they die, they can go back and pick up where they left off.

I know that seems like a lot of work! But Lisp helps manage the difficulty.  To aid in our efforts, we will be using CLOS to write a fully object-oriented game engine---which will help us trim down the code to the minimum through class inheritence, generic functions, and methods specialized on those classes.  Our games will then be built dynamically at run time from the game scripts we provide.

As a final note, it bears mentioning that this isn't a book on AI---so we'll simply be using the best techniques for the current job without much justification or explanation.  For a broader introduction to specialized topics, you can turn to the References section of this website.

## Exercise 2.10.1

**The Player and Character Classes**

```lisp

```

## Exercise 2.10.2

**The Room and Object Classes**

```lisp

```

## Exercise 2.10.3

**Actions**

```lisp

```

## Exercise 2.10.4

**The Game World**

```lisp

```

## Exercise 2.10.5

**Navigation**

```lisp

```

## Exercise 2.10.6

**Basic Agents**

```lisp

```

## Exercise 2.10.7

**Agent Attitudes**

```lisp

```

## Exercise 2.10.8

**Saved Game Files**

```lisp

```

## Extra Credit Exercise 2.10.9

**Multi-User Dungeons**

```lisp

```

## Extra Credit Exercise 2.10.10

**An Asynchronous Web App and Database**

```lisp

```

## Extra Credit Exercise 2.10.11

**Accounts and Authentication**

```lisp

```

## Extra Credit Exercise 2.10.12

**Auto-Save**

```lisp

```

## Extra Credit Exercise 2.10.13

**User-Created Assets**

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/2-09-0-binary-octets-bits/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-11-0-conditions/">Next &raquo;</a><li>
</ul>

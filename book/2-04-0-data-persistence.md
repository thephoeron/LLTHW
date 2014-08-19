<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: Persistence and Databases</li>
</ol>

## Chapter 2.4 --- Extra Credit

# Persistence and Databases

> "You have attributed conditions to villainy that simply result from stupidity."
> <footer>Robert A. Heinlein, <em>Logic of Empire</em></footer>

All applications that allow a user to create or modify data must also allow that user to store their data somewhere, either on their own filesystem, on a server in the cloud, or in a database, and load it back into memory again.  After all, once an application quits, everything in its memory space is effectively lost.  To have that data persist across sessions, it has to be stored *somewhere*, and loaded back into an application's memory when it is needed.  Many strategies exist to achieve this---and we've looked at a couple simple ones already.

Another advantage of storing data outside of an application's memory space, is that it encourages you to validate all data before running it through your program.  In any real-world application, this should be done anyway; but when you know the data is coming from an untrusted source (*i.e.*, anyone who isn't you, the application developer), you're more likely to do things the right way.  While validation of all program input is a non-trivial task, it is essential for building robust user experiences that can handle bad user input as well as malicious attacks against your software.

Whether you store your application's data in a file on a user's computer or in a database where a number of authorized users can access it, you need to spend some time thinking about every piece of data that your application might need to store.  Imagine that the program is loading from scratch, and only has a saved file to restore everything from the last session to memory---if you've stored everything you need to, a user will be able to pick up right where they left off; if you missed anything, you might just annoy a user if it was nothing more than a trivial customization to the UI that you forgot to save, but you could just as easily crash the entire application and corrupt the user's data. Conversely, if data needs to be converted before being used, it's equally important to remember to convert both ways, on the way in, and on the way out.

Sometimes you may also want to serialize and store not just your data, but your code too---saving you the time and effort of rebuilding objects in memory from where they are stored.  This is possible in Lisp because of its homoiconicity.  Being able to treat code as data, and data as code can be just as much of a time-saver as it is a powerful tool for expressing code patterns in macros.  Again, careful thought has to be put into your complete application's life-cycle---if you store executable code, expecting it to run in your application, you'll have to validate it before allowing it to be evaluated. If your application's internal API changes, or a malicious user introduces an exploit into a shared application, once again, your users could lose everything.  As long as you think about security and data integrity, and plan for the worst-case-scenario, you *can* be this creative with your code-base.  Just remember that it will cost you quite a lot of extra time in hardening your application.  If the trade-off is fair, allowing you to include a feature that would otherwise be impractical, then it's all worthwhile.

Lastly, you can also dump an entire Lisp session to your file system, and run it instead of having to load everything into memory again.  Everything you had in memory will be there again when you launch this dumped executable.  This can be useful if you have a lot of customizations, or default packages that you use all the time---but naturally, this too comes with its caveats.

This chapter will contain exercises on:

* Validating input from files, databases, and users
* Creation of binary file formats for saving data
* Saving Complete Lisp Images
* The CL-STORE Library
* Working with Relational Databases
* Document-based Databases

<ul class="pager">
  <li class="previous"><a href="/book/2-03-0-objects-control/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-05-0-extended-types/">Next &raquo;</a><li>
</ul>

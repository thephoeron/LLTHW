<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li class="active">Book</li>
</ol>

<div class="alert alert-danger">
  <p>
    <i class="fa fa-exclamation-triangle"></i> This is a draft-in-progress edition of Learn Lisp the Hard Way.  Content is being constantly added and revised.  Please check back often for updates, and be sure to leave your feedback in the comments.
  </p>
</div>

<p align="center">
  <span style="font-size:36px;font-weight:bold;">Learn Lisp The Hard Way</span><br>
  <span style="font-size:18px;">by the</span><br>
  <span style="font-size:32px;">Toronto Lisp User Group</span><br><br>
  <span style="font-size:18px;">Authors:</span><br>
  <span style="font-size:24px;">
  "the Phoeron" Colin J.E. Lupton<br>
  Leo "Inaimathi" Zovic
  </span><br><br>
  <span style="font-size:18px;">Additional Contributors:</span><br>
  <span style="font-size:24px;">
  Dann Toliver<br>
  Gaelen D'Costa<br>
  Josh Teneycke
  </span>
</p>

<p align="center">
<a rel="license" href="http://creativecommons.org/licenses/by-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nd/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Learn Lisp The Hard Way</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.lisptoronto.org" property="cc:attributionName" rel="cc:attributionURL">the Toronto Lisp User Group</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nd/4.0/">Creative Commons Attribution-NoDerivatives 4.0 International License</a>.
</p>


```lisp
;; Welcome to L(λ)THW!
(let ((llthw '(learn lisp the hard way)))
  (format t "~{~@(~A~)~^ ~}, because ~{~A~^ ~} is easier!" llthw (cddr llthw)))

;; Common Lisp: Powerful, Expressive, Programmable, General Purpose, Multi-Paradigm.

```

### Draft Chapter Status Legend

<dl class="dl-horizontal">
  <dt><i class="glyphicon glyphicon-remove text-danger"></i></dt>
  <dd>Unstarted</dd>
  <dt><i class="glyphicon glyphicon-refresh text-warning"></i></dt>
  <dd>In-Progress/Incomplete</dd>
  <dt><i class="fa fa-code"></i></dt>
  <dd>Chapter Exercises in-progress</dd>
  <dt><i class="glyphicon glyphicon-ok text-success"></i></dt>
  <dd>Complete, Awaiting Approval from Editor</dd>
  <dt><i class="glyphicon glyphicon-thumbs-down text-danger"></i></dt>
  <dd>Not Approved/Rejected, needs re-writing</dd>
  <dt><i class="glyphicon glyphicon-thumbs-up text-info"></i></dt>
  <dd>Approved and Complete</dd>
</dl>

# Contents at a Glance

<dl class="dl-horizontal">
  <dt>Preface</dt>
  <dd>
    <ul>
      <li><a href="preface/">TANSTAAFL</a> <i class="glyphicon glyphicon-ok text-success"></i></li>
      <li><a href="preface-part-two/">The Hard Way Is Easier</a> <i class="glyphicon glyphicon-refresh text-warning"></i></li>
      <li><a href="preface-part-three/">Who Is This Book For?</a> <i class="glyphicon glyphicon-thumbs-down text-danger"></i></li>
      <li><a href="introduction/">Lisp: A Future History</a> <i class="glyphicon glyphicon-refresh text-warning"></i></li>
      <li><a href="acknowledgements/">Acknowledgements</a> <i class="glyphicon glyphicon-refresh text-warning"></i></li>
    </ul>
  </dd>
  <dt>PART ONE</dt>
  <dd>
    <a href="1-0-0-overview/">Grokking Lisp</a>
    <ul>
      <li>
        <a href="1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
        <i class="fa fa-code"></i>
      </li>
      <li>
        <a href="1-02-00-input-output/">Printing, Strings and Streams</a>
        <i class="glyphicon glyphicon-ok text-success"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-03-0-getting-input-from-users/">Getting Input from Users</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
        <i class="fa fa-code"></i>
      </li>
      <li>
        <a href="1-04-0-lists/">Lists and List-Operations</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
        <i class="fa fa-code"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-05-0-lookups-trees/">Look-up Lists and Trees</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
        <i class="fa fa-code"></i>
      </li>
      <li>
        <a href="1-06-0-math/">Numbers and Math</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
        <i class="fa fa-code"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-07-0-arrays/">Arrays and Vectors</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="1-08-0-variables/">Variables, Parameters, and Constants</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-09-0-closures/">Closures</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="1-10-0-functions/">Functions and Macros</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-11-0-text-adventure/">A Simple Text Adventure</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="1-12-0-namespaces/">Namespaces, Symbols, Packages, and Systems</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-13-0-simple-web-app/">A Simple Web Application</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="1-14-0-conditionals/">Conditionals</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-15-0-command-line-utility/">Command-Line Utilities</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="1-16-0-map-loop/">Mapping and Looping</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-17-0-iterate/">Revisiting Loops with Iterate</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="1-18-0-format/">Format Strings</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="1-19-0-dsl/">Domain Specific Languages</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
        <i class="fa fa-code"></i>
      </li>
      <li>
        <a href="1-20-0-review/">Part One in Review</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
    </ul>
  </dd>
  <dt>PART TWO</dt>
  <dd>
    <a href="2-0-0-overview/">The Suffusion of Blue</a>
    <ul>
      <li>
        <a href="2-01-0-programming-paradigms/">Programming Paradigms</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-02-0-regex/">Regular Expressions</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-03-0-objects-control/">Objects and Control Structures</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-04-0-data-persistence/">Persistence and Databases</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-05-0-extended-types/">Extended Types</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-06-0-threads-memos-parallel/">Concurrency and Memoization</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-07-0-logic-and-more-math/">Logic and Advanced Math</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-08-0-number-theory/">Number Theory</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-09-0-binary-octets-bits/">Binary Streams, Octet-Vectors, and Bit-Vectors</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-10-0-improved-text-adventure-engine/">An Improved Text Adventure Engine</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-11-0-conditions/">Conditions and Error Handling</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-12-0-2d-game/">Write a 2D Game</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-13-0-compiler/">The Compiler</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-14-0-tree-shaker/">Write a Tree-Shaker</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-15-0-docs-and-inspection/">Documentation and Inspection</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-16-0-foreign-libs/">Foreign Libraries in Lisp</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-17-0-debugging-testing/">Debugging and Unit Testing</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-18-0-ffi/">Write a Foreign Function Interface</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-19-0-essential-libs/">Essential Lisp Libraries</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        Extra Credit:
        <a href="2-20-0-packaging-libs/">Packaging Lisp Libraries</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="2-21-0-review/">Detailed Syntax Review</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
    </ul>
  </dd>
  <dt>PART THREE</dt>
  <dd>
    <a href="3-00-00-overview/">Lisp So(u)rcery</a>
    <ul>
      <li>
        <a href="3-01-00-web-apps/">Real-world Web Apps</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-02-00-typesetting/">Typesetting</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-03-00-mobile/">Native Mobile Applications</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-04-00-gui/">Cross-platform Desktop Applications</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-05-00-system-utils/">Drivers, Daemons, and System-Utilities</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-06-00-reverse-engineering/">Reverse Engineering</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-07-00-graphics/">Graphics Rendering</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-08-00-gaming/">OpenGL, SDL, and 3D Game Development</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-09-00-audio/">Audio Generation and Manipulation</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-10-00-data/">Data Aggregation and Analysis</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-11-00-cryptosec/">Cryptography and Security</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-12-00-fintech/">Financial Software and Crypto-Currencies</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-13-00-scientific-computing/">Scientific Computing</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-14-00-computational-physics/">Computational Physics</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-15-00-quantum-computing/">Quantum Computing</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-16-00-nlp/">Natural Language Processing</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-17-00-ai/">Artificial Intelligence</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-18-00-robotics/">Robotics</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-19-00-space-tech/">Space Tech</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-20-00-neurotech/">Neuroscience and Thought-Controlled Computing</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-21-00-lispos/">A Simple LispOS</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-22-00-lisp-machine/">Build Your Own Lisp Machine</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
      <li>
        <a href="3-23-00-gov-mil/">Government and Military Grade Systems</a>
        <i class="glyphicon glyphicon-refresh text-warning"></i>
      </li>
    </ul>
  </dd>
</dl>

# Table of Contents

Coming Soon

# Recent Updates

For a list of recent updates, please see the <a href="https://github.com/thephoeron/llthw/commits" target="_blank">Commit History on GitHub</a>.  Updates to the LLTHW repository are generally pushed to the live server within 24 hours.

# FAQ

How long does this book take to complete?

: You should take as long as you need with each module to fully grasp the material.  It's not a race, and the only deadlines are the ones you set for yourself.

: Assuming you already have some programming experience and can do at least one module a day, you should expect to spend at least three months.

What kind of computer do I need?

: Common Lisp is available for nearly every platform. Your personal computer, whether it be a Mac, Windows, or Linux platform, will be fine.  For all the features of this website, however, you may need to update your browser to the latest version of Chrome, Firefox, or Safari.

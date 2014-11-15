<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Build Your Own Lisp Machine</li>
</ol>

## Chapter 3.21

# Build Your Own Lisp Machine

> "Relevant quote..."
> <footer>Source</footer>

Few topics capture the imagination of budding Lisp Hackers more than the legendary Lisp Machines---the first personal workstations in a world of time-shared, multi-user mainframes, with a fully integrated and interactive hardware and software environment, that seemed to offer unrivaled competitive-edge for the team that could afford them.  Unfortunately, with the rise of IBM-Compatible Personal Computers, available at a fraction of the cost, the highly specialized and costly Lisp Machines were the first casualties of the AI Winter. But the dream of the Lisp Machine has never died.

Back in the 80s, there were a significant number of competing architectures, the various Lisp Machine chipsets being only a small number of them; but over the past 30 years, there has been a significant push by Intel to be the dominant architecture through a process of generalization---by developing a processor architecture that was more generally useful to multiple platforms and purposes, instead of being specialized, they were able to cater to more users and rapidly seize control of the largest market share---even going so far as to partner with Apple, to unify the underlying, previously competing architectures of Macintosh and IBM-Compatible PCs.

But over the past decade, there has been a shift back towards specialized hardware, heavily prompted by the Internet-of-Things movement and the surprising success of mobile devices and smart phones.  These days, reprogrammable hardware is available for little more than a full professional workstation, and once a chipset design has been tested extensively on an FPGA-based board, it can be ported to an ASIC design for microfabrication by a host of companies with competitive rates.  These days, pretty much anyone can design, test, and implement a custom computer architecture, and get their design built and shipped to their front door as a big wafer.  In one sense, it's a little silly, since this plethora of home-built architectures means more and more platforms exist, for which there is no compatible software or compilers---but combined with a sensible use of an existing standard instruction set, it does make for a powerful toolchain for the home inventor.

As to reawakening the dream of the Lisp Machine, there has been a significant amount of progress in the Lisp community in that direction.

This chapter will contain a review of available FPGA-based boards and ASIC manufacturers; a brief primer on synthesizable Verilog, and a DSL for producing Verilog/VHDL from Common Lisp source-code; and a schema for a 64-bit Lisp Machine.  As an extra credit exercise, we will modify an existing Common Lisp implementation to run directly on this Lisp Machine and use it as the basis for a LispOS for your new Lisp Machine.

<ul class="pager">
  <li class="previous"><a href="/book/3-20-0-lispos/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-22-0-gov-mil/">Next &raquo;</a><li>
</ul>

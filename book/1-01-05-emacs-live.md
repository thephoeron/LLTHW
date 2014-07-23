<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Extra Credit: Set Up and Learn Emacs Live</li>
</ol>

# Extra Credit Exercise 1.1.5

## Set Up and Learn Emacs Live

<div class="alert alert-success">
  <strong>Tip:</strong>
  <p>This is your first Extra Credit exercise.  Extra Credits are not mandatory&mdash;they provide additional material and challenges to deepen your understanding of the preceeding exercises, and often focus on libraries that extend the Common Lisp standard or tools that might help you improve your workflow. If you find them too hard or distracting, you can skip over them for now and come back to tackle them later.</p>
</div>

If you already have some familiarity with Emacs, Vim, or advanced IDEs for other programming languages, or you're not afraid of a little extra challenge, you can take advantage of the full interactive approach to development that Lisp Hackers enjoy.

While some people find the learning curve to Emacs a little steep, a number of budding Lisp Hackers found that learning Emacs first allowed them to dive deeper into Lisp, and experience the language more fully while learning.

The fact is, Emacs only looks intimidating these days because of emphasis on flashy point-and-click or touch-based graphical interfaces.  Not very long ago, the keyboard was the only input device for a computer, and even after the invention of the mouse, power users found the mouse to hold back their productivity with the computer.  Emacs perfected the art of keyboard-only input---in other words, there is a keyboard shortcut for virtually all functionality in Emacs, so your hands never have to stop and reach for the mouse, and your mind never haves to break out of the flow. In short, if you know how to type, you already know how to use Emacs.

### Emacs Live

Emacs Live is a particularly fun package, custom designed for interactive development in Lisp-family languages.  It's not a separate distribution of Emacs, it's more of a package that manages your Emacs configuration directory.  It starts with a heavily customized configuration, a wide variety of useful plugins, and finished off with an extra polish for managing custom extensions, woven together to create the ultimate hacking experience.  In fact, this very book and its Common Lisp powered site was written in Emacs Live.

In addition to Emacs, and the Emacs Live package, you will need the Live Pack for Common Lisp, that adds full auto-completion and pop-up documentation for Common Lisp, plus better plugins for navigating your file tree and accessing the command line.

To complete this exercise, you will already need to have git, SBCL and Quicklisp installed, as described in the previous exercise. So let's get started!

### Installing Emacs

To support Emacs Live, you need at least version 24.3 of Emacs.  A lot of computers already have Emacs installed, but you might have to update to the latest version.

#### Windows

Create the directory `C:\emacs`, and download the latest version of Emacs for Windows into this folder from [http://ftp.gnu.org/gnu/windows/emacs/](http://ftp.gnu.org/gnu/windows/emacs/).  As of the time of this writing, the file you want is `emacs-24.3-bin-i386.zip`, which you can find near the bottom of the page.  There are also `*.zip.sig` files, which you can use to verify the downloaded zip file if you wish.

Once the download completes, extract the zip archive to `C:\emacs`.  If you visit `C:\emacs` with your file manager, you should now see the directory `emacs-24.3` inside `C:\emacs`.  Inside it, there should be other folders such as `bin`, `etc`, `info`.  If you don't see these, double-check that you followed the instructions above exactly; if you did, then there might be something wrong with the downloaded zip archive.

Now, depending on your version of Windows, you may have to do a few different things at this point.

**Windows 95 or 98**: edit your `autoexec.bat` file and add the following line:

```sh
set HOME=C:\emacs\
```
Note: *You will probably find your `autoexec.bat` file directly under `C:\\` drive. In Notepad, open it using the File menu.*

**Windows 2000, ME, XP, or Vista**: add `HOME` as an environment variable. Go to `Start > Settings > Control Panel > System`.  Select `Advanced`, then `Environment Variables`.  Add `HOME` as a user variable, with its value `C:\emacs\\`.

**Windows 7 or 8**: add `HOME` as an environment variable. Go to `Start > Control Panel > System and Security > System > Advanced system settings`.  Select `Advanced`, then `Environment Variables`.  Add `HOME` as a user variable, with its value `C:\emacs\\`.

Restart your computer.

At this point, you can add the Desktop and Start Menu shortcuts for Emacs, but don't run it yet.

Visit `C:\emacs\emacs-24.3\bin` and run `addpm.exe`.  This will add Emacs to your Start Menu.  You can also manually create a shortcut to `runemacs.exe` in the same directory, and drag it to your desktop.

For both the Desktop Shortcut and the Start Menu item, you will want to change the default 'Start In' folder.  Right click on each, and in the Properties menu, change the *Start In* folder to your home directory, which will be something like `C:\your-username`.

Before running Emacs, make sure you've completed the installation of Emacs Live and the SLIME-Pack for Emacs Live below.

#### Mac OS X

Go to <a href="http://emacsformacosx.com" target="_blank">emacsformacosx.com</a> and download the universal binary available there.

In the `*.dmg` file you get, copy Emacs.app to your Applications folder.

That's it for now!  Before running Emacs, make sure you've completed the installation of Emacs Live and the SLIME-Pack for Emacs Live below.

#### Linux

Most distros of Linux already come with Emacs installed.  Check through your package manager to make sure at least version 24.3 of Emacs is installed.

If your distro's package manager doesn't include Emacs 24.3 as a prebuilt binary, you may have to compile and install it from source.

### Installing Emacs Live

If you are using Linux or OS X, you can install Emacs Live with a convenient "brogrammer" script.  Otherwise, you can simply use git to clone Emacs Live, and using `git` you can always keep the software up-to-date.

#### Windows

Either from your favorite GIT client or from the command line, clone the Emacs Live repo as `.emacs.d` into `C:\emacs`:

```sh
$ git clone git://github.com/overtone/emacs-live.gt C:\emacs\.emacs.d
```

Create the directory `.live-packs` under `C:\emacs`, and copy the directory `C:\emacs\.emacs.d\packs\template` to `C:\emacs\.live-packs`.  Rename `C:\emacs\.live-packs\template` to `C:\emacs\.live-packs\{your-username}-pack`, replacing "{your-username}" with your actual username on the computer, no spaces or special characters.  This gives you a special Live Pack to add your own customizations to Emacs Live later.

Create the file `.emacs-live.el` under `C:\emacs`.  This is just a plain text file, with the Emacs Lisp file extension.

In `.emacs-live.el`, add the following line and save the file:

```elisp
(live-append-packs '(~/.live-packs/your-username-pack))
```

Make sure you replace "your-username" token with the actual name of the folder you created under `C:\emacs\.live-packs`.

#### Mac OS X and Linux

From the command line, all you have to do is run:

```sh
$ bash <(curl -fksSL https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh)
```

It will install Emacs Live to `~/.emacs.d/`, create your Live Packs directory, and get you set up with an `~/.emacs-live.el` start-up hook file.  Also, if you already have an existing `~/.emacs.d` directory and `~/.emacs` config file, it will move them out of the way to a safe place.

### Installing SLIME-Pack for Emacs Live

Now, all you have to do is add the SLIME-Pack for Emacs Live.

Under the `.live-packs` directory created above (either manually or through the brogrammer install-script), clone the SLIME-Pack repo with `git`:

```sh
$ cd ~/.live-packs
$ git clone https://github.com/thephoeron/slime-pack.git
```

Add the following line to your `.emacs-live.el` file, *before* the line that points to your personal user pack:

```elisp
(live-append-packs '(~/.live-packs/slime-pack/))
```

All done! Now you can move on to the next section and run Emacs!

## Using Emacs Live + SLIME

Now that everything is set-up and configured, you are ready to fire up Emacs for the first time.  Run the application as you normally would for your platform, sit back and watch the show.

<div class="alert alert-success">
  <strong>Tip:</strong>
  <p>You can start Emacs from a different folder instead of from your home folder, which is the default when you launch Emacs from your operating system's menu (or the Applications folder on OS X).</p>
  <p>From the command line, switch to a project directory, and run Emacs from that folder.  For example, if you've cloned a copy of Learn Lisp The Hard Way into your Quicklisp Local-Projects folder:</p>
  <pre>$ cd ~/quicklisp/local-projects/llthw
$ emacs</pre>
  <p>If it's a <code>git</code> repository folder, like a clone of LLTHW would be, you will automatically get access to some useful Git plugins in Emacs Live.</p>
</div>

If you did everything correctly above, after a moment watching Emacs Live load up all its packages and config files, you should be presented with a shimmering ASCII Art banner that looks a little like this:

```elisp
;;
;;     MM""""""""`M
;;     MM  mmmmmmmM
;;     M`      MMMM 88d8b.d8b. .d8888b. .d8888b. .d8888b.
;;     MM  MMMMMMMM 88''88'`88 88'  `88 88'  `"" Y8ooooo.
;;     MM  MMMMMMMM 88  88  88 88.  .88 88.  ...       88
;;     MM        .M dP  dP  dP `88888P8 '88888P' '88888P'
;;     MMMMMMMMMMMM
;;
;;         M""MMMMMMMM M""M M""MMMMM""M MM""""""""`M
;;         M  MMMMMMMM M  M M  MMMMM  M MM  mmmmmmmM
;;         M  MMMMMMMM M  M M  MMMMP  M M`      MMMM
;;         M  MMMMMMMM M  M M  MMMM' .M MM  MMMMMMMM
;;         M  MMMMMMMM M  M M  MMP' .MM MM  MMMMMMMM
;;         M         M M  M M     .dMMM MM        .M
;;         MMMMMMMMMMM MMMM MMMMMMMMMMM MMMMMMMMMMMM  Version 1.0beta24
;;
;;           http://github.com/overtone/emacs-live
;;
;; Colin, turn your head towards the sun and the shadows will fall behind you.

```

If you end up with some ASCII-art that looks like a mushroom cloud, well, you messed up somewhere.  Double-check every step, and make sure you followed the instructions *exactly*.  If all else fails, you can ask for help in the comments, or create an issue on the Emacs Live github repo.

### Keyboard Shortcuts

Emacs uses a special Keyboard Shortcuts notation to refer to its keybindings.  There are defaults, but since you can change the actual key on the keyboard used for the Emacs "Control" and "Meta" bindings, this notation refers to the actual binding.

The notation and their default bindings is as follows:

<dl class="dl-horizontal">
    <dt>C (Control)</dt>
    <dd>Ctrl, control key</dd>
    <dt>M (Meta)</dt>
    <dd>Alt or Cmd key, depending on your platform.  In some cases this is mapped to Esc or Caps Lock.</dd>
    <dt>S (Shift)</dt>
    <dd>shift key</dd>
    <dt>ESC (Escape)</dt>
    <dd>escape key</dd>
    <dt>SPC (Space)</dt>
    <dd>space bar</dd>
</dl>

When you see an Emacs keyboard-shortcut sequence, it will look something like this: <kbd>C-x C-c</kbd> or <kbd>M-x</kbd> <code>slime</code>.  <kbd>C-x C-c</kbd> means hold down Control, x, then c; this quits Emacs.  <kbd>M-x</kbd> <code>slime</code> means hold down Meta and x, then at the minibuffer prompt that comes up, type <code>slime</code> and hit Return/Enter.  This will open and put you in the Common Lisp REPL.

With Emacs Live + SLIME open, take some time to practice all the keyboard shortcuts that follow, repeating as many times as necessary for you to remember them.  Once you get a feel for Emacs, you'll be hard-pressed to go back to the clunky point-and-click interfaces of other IDEs and text editors.

#### General

<dl class="dl-horizontal">
    <dt><kbd>C-x C-c</kbd></dt>
    <dd>Quit Emacs, prompt to close any running processes.</dd>
    <dt><kbd>C-g</kbd></dt>
    <dd>Keyboard quit, cancel a dialog or command.</dd>
    <dt><kbd>M-x</kbd></dt>
    <dd>Prompt to run a command by name</dd>
    <dt><kbd>M-h ?</kbd></dt>
    <dd>Emacs Help menu</dd>
    <dt><kbd>M-h t</kbd></dt>
    <dd>Default Emacs tutorial</dd>
    <dt><kbd>M-h k</kbd></dt>
    <dd>Show the function for a keyboard shortcut</dd>
    <dt><kbd>M-h f</kbd></dt>
    <dd>Show the documentation string for a function</dd>
</dl>

Pay special attention to <kbd>M-h t</kbd>, the Default Emacs tutorial.  You may want to take this opportunity to follow it now to get a feel for the usual editing and navigation flow in Emacs.  It doesn't take long!

#### SLIME, the Superior Lisp Interaction Mode

Now that you've got a feel for using Emacs itself, it's time to dive into SLIME so you can get to live-hacking in Lisp.

First of all, use the Emacs keyboard shortcuts to create a new `*.lisp` file, and make sure you have the REPL open next to your new `*.lisp` file's buffer, so you can see them both at the same time.  Don't worry too much about the example code in this section, it is pretty simple stuff to show you SLIME in action, and will all be explained in later exercises.

In your new Lisp file, type the following:

```lisp
(defun my-addition-function (&rest rest)
  "A quick and dirty addition function."
  (apply #'+ rest))

(my-addition-function 10 9 8 7 6 5 4 3 2 1)
```

Once you've finished that, save it using the Emacs keyboard shortcuts you learned in the Emacs Tutorial.

Move the cursor back up to the last closing parens at the end of the `(defun my-addition-function ...)` form, and execute it with the keyboard shortcut <kbd>C-x C-e</kbd>.  In the minibuffer, it will show you the return value of this, the name of the function.  This means you successfully compiled your first function with SLIME!

You can now use this function in code.  Go to the end of the line where you called `my-addition-function`, and once again hit the keyboard shortcut <kbd>C-x C-e</kbd>.  Now in the minibuffer you should see the result of the function: `55`.

Don't believe me that running and compiling your code in Lisp is that easy and fast?  Well, try this out too:

```lisp
(disassemble #'my-addition-function)
```

You'll see a lovely assembly dump of your new function printed in the REPL.

If anything goes wrong in your live-hacking adventures, SLIME will drop you into an interactive debugger, which you can navigate with either the keyboard or the mouse, digging through the code until you figure out what's wrong and how to fix it.  Usually the debugger is quite helpful, and will have you fixing your bugs in a fraction of the time as normal.

#### Autocompletion and Live Documentation

You don't have to know much to make use of this plugin in Emacs Live.  It pops up as you're typing with a list of suggestions based on the Common Lisp language and all your open buffers; you can navigate the list of suggested auto-completions with the <kbd>&uarr;</kbd> (Up) and <kbd>&darr;</kbd> (Down) arrow keys.  When you highlight an auto-completion entry, if it has a little letter `l` at the right of the menu item, a documentation entry will pop-up next to it.  This documentation comes from the source-code "docstrings"---so when working on a library of your own, make sure to write helpful documentation.  You'll thank yourself for it later.

To select a suggested auto-completion entry and move the cursor to the end of that word, move down the list to select the entry you want and press the <kbd>TAB</kbd> key.

Auto-completion works in both Lisp-mode buffers and the SLIME REPL.

#### Paredit

When in Lisp-mode, *i.e.,* in a buffer that contains a `*.lisp` file, Paredit is your next best friend after SLIME itself; and the two work together very well.

Note: Paredit is not enabled by default in the SLIME REPL.

<dl class="dl-horizontal">
    <dt><kbd>C-)</kbd></dt>
    <dd>Slurp the next expression into this expression</dd>
    <dt><kbd>C-(</kbd></dt>
    <dd>Slurp the previous expression into this one</dd>
    <dt><kbd>C-}</kbd></dt>
    <dd>Barf the current expression out to the right of its parent expression</dd>
    <dt><kbd>C-{</kbd></dt>
    <dd>Barf the current expression out to the left of its parent expression</dd>
    <dt><kbd>C-q )</kbd></dt>
    <dd>Force insert a closing paren</dd>
</dl>

#### Neo-Tree

To activate the Neo-Tree plugin, so you can browse your project directory like you normally would in a file manager or other IDE, just hit the <kbd>F8</kbd> key.  A tree will appear to the left of your editor.

#### Multi-Term

Emacs has built in support to open terminal buffers, but the Multi-Term plugin has several notable improvements over the limitations of <kbd>M-x</kbd> `shell` and <kbd>M-x</kbd> `term`.

To open a new terminal in your current buffer, use <kbd>M-x</kbd> `multi-term`.  I usually create a new buffer just for the terminal below the SLIME REPL, which you can do like this:

* Use <kbd>C-x o</kbd> to switch to the next window, until you get to your open SLIME REPL.
* Split the SLIME REPL window vertically with <kbd>C-x 2</kbd> (new window below)
* <kbd>C-x o</kbd> again to go to the new window, which will be a copy of the SLIME REPL buffer at first.
* <kbd>M-x</kbd> `multi-term` to open your shell in that buffer

You now have the command line right in Emacs, alongside your editor and REPL!

<ul class="pager">
  <li class="previous"><a href="/book/1-01-04-configuration/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-00-input-output/">Next &raquo;</a><li>
</ul>

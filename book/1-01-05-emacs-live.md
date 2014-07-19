<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Extra Credit: Set Up and Learn Emacs Live</li>
</ol>

# Extra Credit Exercise 1.1.5

## Set Up and Learn Emacs Live

This is your first Extra Credit exercise.  Extra Credits are not mandatory---they provide additional material and challenges to deepen your understanding of the preceeding exercises, and often focus on libraries that extend the Common Lisp standard or tools that might help you improve your workflow. If you find them too hard or distracting, you can skip over them for now and come back to tackle them later.

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
> git clone git://github.com/overtone/emacs-live.gt C:\emacs\.emacs.d
```

Create the directory `.live-packs` under `C:\emacs`, and copy the directory `C:\emacs\.emacs.d\packs\template` to `C:\emacs\.live-packs`.  Rename `C:\emacs\.live-packs\template` to `C:\emacs\.live-packs\{your-username}-pack`, replacing "{your-username}" with your actual username on the computer, no spaces or special characters.  This gives you a special Live Pack to add your own customizations to Emacs Live later.

Create the file `.emacs-live.el` under `C:\emacs`.  This is just a plain text file, with the Emacs Lisp file extension.

In `.emacs-live.el`, add the following line and save the file:

```elisp
(live-append-packs '(~/.live-packs/{your-username}-pack))
```

Make sure you replace the "{your-username}" token with the actual name of the folder you created under `C:\emacs\.live-packs`.

#### Mac OS X and Linux

From the command line, all you have to do is run:

```sh
bash <(curl -fksSL https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh)
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

Take some time to practice all the keyboard shortcuts that follow, repeating as many times as necessary for you to remember them.  Once you get a feel for Emacs, you'll be hard-pressed to go back to the clunky point-and-click interfaces of other IDEs and text editors.



<ul class="pager">
  <li class="previous"><a href="/book/1-01-04-configuration/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-00-input-output/">Next &raquo;</a><li>
</ul>

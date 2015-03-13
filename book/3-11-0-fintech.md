<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Financial Software and Crypto-Currencies</li>
</ol>

## Chapter 3.11

# Financial Software and Crypto-Currencies

> "'Value' has no meaning other than in relationship to living beings... This very personal relationship, 'value', has two factors... first, what he can do with a thing, its use to him... and second, what he must do to get it, its <em>cost</em> to him."
> <footer>Robert A. Heinlein, <em>Starship Troopers</em></footer>

Out of all the commercial ventures available to a budding entrepreneur, the most dangerous undertaking is handling other people's money.  Not just for the obvious reasons, such as becoming a target for theft, exploitation, and blackmail---but the liability alone, the stifling regulatory systems, and compliance requirements make the financial industry a deeply uncomfortable place for newcomers.  With this in mind, you can wonder at the audacity of the Bitcoin and crypto-currency community, that has spearheaded a new digital economy without taking such factors into consideration; and then realize why so many Bitcoin companies are failing.  The biggest problem may be self-evident to certain people, but is not often discussed amongst members of commercial crypto-currency start-ups---Bitcoin was specifically designed to sabotage the financial industry through total decentralization, not to be used as a tool to build banks and other money service businesses for cheap.  With that point in mind, this chapter will adopt the attitude of personal, decentralized banking, where you take the control and security of *your* money into your own hands---however, many of the necessary skills needed to design a personal Bitcoin wallet are transferable to the financial industry as a whole.  And, as it so happens, Common Lisp is often used in financial industry software, so if this is your area of interest, you'll have no trouble fitting in.

Naturally, security is of utmost concern; so if you have not already read it, worked through the exercises, and done the extra readings from the Resources section, you should go back and read Chapter 3.10 -- Cryptography and Security first.  In any banking system, the only factor more important than compliance with your local financial regulatory body is the security of that system.  Other factors that you will have to consider, even for a personal wallet, are accounting ledgers, transaction histories, and encrypting your wallet.  Money service businesses also have to maintain strict Know-Your-Customer and Anti-Money-Laundering policies.

So in this chapter, we'll take an overview of the strongest encryption protocols available in Common Lisp, design a personal wallet that utilizes Bitcoin to store and transfer value, interface with the Bitcoin blockchain from Common Lisp, and review some of the more interesting Bitcoin Improvement Proposals (BIPs) to add valuable features to your personal wallet.  We will also point you to some important resources for learning how to do a basic security profile of your application, to harden your wallet against potential loss through theft or other malicious activity.

## Exercise 3.11.1

**Working with Crypto-Currencies in Common Lisp**

## Exercise 3.11.2

**JSON-RPC Interfaces**

## Exercise 3.11.3

**ECDSA, SHA256, and Ripemd160**

## Exercise 3.11.4

**Base-58 and Base-64 Representations**

## Exercise 3.11.5

**Transactions**

## Exercise 3.11.6

**Addresses**

## Exercise 3.11.7

**Op-Codes**

## Exercise 3.11.8

**Scripts**

## Exercise 3.11.9

**Unspent-Outs**

## Exercise 3.11.10

**Wallets**

## Exercise 3.11.11

**Writing an Encrypted Wallet**

Two methods:

* Encrypt database fields individually
* Encrypt Wallet Instance Object

## Exercise 3.11.12

**Providing a RESTful API to the Blockchain**

## Exercise 3.11.13

**Hierarchical--Deterministic Keychains**

## Project 3.11.14

**A Personal Bitcoin Wallet Web-App**

<ul class="pager">
  <li class="previous"><a href="/book/3-10-0-cryptosec/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-12-0-scientific-computing/">Next &raquo;</a><li>
</ul>

# wellbody-config

Contains relevant customizations of Bahmni for the Wellbody Clinic in Sierra Leone. 


## Steps for applying a patch to our custom version of the Bahmni-App modules

(Probably need a better place for this documentation, but don't want add to the bahmni-apps README since this is PIH-
specific information)

In order to to meet the needs of our implementations, we are running our own custom fork of the Bahmni Apps module where
we apply our own changes and bug fixes.  The idea is that these will all eventually be merged into the Bahmni Apps
master repo, but we don't want to wait for that merge to happen.

Whenever we apply a patch for bahmni apps we should follow this process to make sure that the patch is properly applied
and the required pull request is issued to the Bahmni Team.

You shoud always develop against the PIH/release-x branch of Bahmni Apps, where PIH refers to the PIH fork
in the PIH repo, and x refers to the current version of bahmni we are running. This branch should always reflect the 
current code we are runnning in production.

However, in order to make individual pull requests against bahnni, we need to make the commit against the *bahmni/release-x* 
branch, not the *PIH/release-x branch*.  

So, assuming, you have the *PIH/release-x* branch checked out and have *uncommitted changes* you are ready to commit, you'd
do the following.

1) *Stash* your changes

2) Checkout the *bahmni/release-x* branch as a new local branch named after the ticket number you are applying the fix for 
(ie SL-x)

3) Pop your changes off the stash and commit your changes to this branch with the approprite commit message

4) Push this new branch up to *PIH* repo as a new branch
 
5) Find this new branch in th the PIH repo in github and issue a pull request against the Bahmni *master* branch.  If all 
is correct, this pull request should *only* contain the changes from your current commit.

6) After the pull request has been issued, go back and checkout the *pih/release-x* branch.

7) Merge in the SL-x local branch you created into *pih/release-x*

8) Push up the changes in the release-x branch to the PIH repo

*When this process will fail:* if you are making a commit that follows on to an existing commit made to the PIH/release-x 
branch that has not yet been merged into master.  What is the correct procedure in this case? Should you create a new branch
off the previous branch created for the existing commit you are following on from?

## Steps for keeping our version of Bahmni Apps up-to-date

(TODO: confirm this is correct)

At regular intervals, we should pull in any new changes to the *bahmni/release-x* branch into our own *pih/release-x* branch.

1) Make sure you have no uncommitted changes.  

2) Check out your local *release-x* branch.  (If you don't have a local *release-x* branch, checkout *pih/release-x* as new 
local branch *release-x*.)

3) Merge *bahmni/release-x* into your local *release-x*.  (Question: does one have to do anything specific (git fetch?) to make
sure that the *bahmni/release-x* branch is up-to-date with any remote changes?)

4) Push your local *release-x* up to *pih/release-x*.

## Steps for updating Bahmni Apps when upgrading the version of Bahmni we are using

When we upgrade to a new version of Bahmni, we want to start using the version of Bahmni Apps associated with that version,
but we *don't* want to lose any custom modifications we've made that haven't been merged back in.  

Steps:

1) Make sure you have no uncommited changes.  Check out the *bahmni/release-x* branch as a new local branch *release-x* 
(where x is the version we are upgrading to)

2) Merge the *pih/release-(x-1)* branch (where x-1 is the current version we are using)

3) Resolve conflicts and push this new local branch release-x up to the *PIH* repo





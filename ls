GIT(1)                                                      Git Manual                                                      GIT(1)

NNAAMMEE
       git - the stupid content tracker

SSYYNNOOPPSSIISS
       _g_i_t [--version] [--help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p|--paginate|-P|--no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           [--super-prefix=<path>] [--config-env=<name>=<envvar>]
           <command> [<args>]

DDEESSCCRRIIPPTTIIOONN
       Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both
       high-level operations and full access to internals.

       See ggiittttuuttoorriiaall(7) to get started, then see ggiitteevveerryyddaayy(7) for a useful minimum set of commands. The GGiitt UUsseerr’’ss MMaannuuaall[1]
       has a more in-depth introduction.

       After you mastered the basic concepts, you can come back to this page to learn what commands Git offers. You can learn more
       about individual Git commands with "git help command". ggiittccllii(7) manual page gives you an overview of the command-line
       command syntax.

       A formatted and hyperlinked copy of the latest Git documentation can be viewed at hhttttppss::////ggiitt..ggiitthhuubb..iioo//hhttmmllddooccss//ggiitt..hhttmmll
       or hhttttppss::////ggiitt--ssccmm..ccoomm//ddooccss.

OOPPTTIIOONNSS
       --version
           Prints the Git suite version that the _g_i_t program came from.

           This option is internally converted to ggiitt vveerrssiioonn ......  and accepts the same options as the ggiitt--vveerrssiioonn(1) command. If
           ----hheellpp is also given, it takes precedence over ----vveerrssiioonn.

       --help
           Prints the synopsis and a list of the most commonly used commands. If the option ----aallll or --aa is given then all
           available commands are printed. If a Git command is named this option will bring up the manual page for that command.

           Other options are available to control how the manual page is displayed. See ggiitt--hheellpp(1) for more information, because
           ggiitt ----hheellpp ......  is converted internally into ggiitt hheellpp .......

       -C <path>
           Run as if git was started in _<_p_a_t_h_> instead of the current working directory. When multiple --CC options are given, each
           subsequent non-absolute --CC <<ppaatthh>> is interpreted relative to the preceding --CC <<ppaatthh>>. If _<_p_a_t_h_> is present but empty,
           e.g.  --CC """", then the current working directory is left unchanged.

           This option affects options that expect path name like ----ggiitt--ddiirr and ----wwoorrkk--ttrreeee in that their interpretations of the
           path names would be made relative to the working directory caused by the --CC option. For example the following
           invocations are equivalent:

               git --git-dir=a.git --work-tree=b -C c status
               git --git-dir=c/a.git --work-tree=c/b status

       -c <name>=<value>
           Pass a configuration parameter to the command. The value given will override values from configuration files. The
           <name> is expected in the same format as listed by _g_i_t _c_o_n_f_i_g (subkeys separated by dots).

           Note that omitting the == in ggiitt --cc ffoooo..bbaarr ......  is allowed and sets ffoooo..bbaarr to the boolean true value (just like
           [[ffoooo]]bbaarr would in a config file). Including the equals but with an empty value (like ggiitt --cc ffoooo..bbaarr== ......) sets ffoooo..bbaarr
           to the empty string which ggiitt ccoonnffiigg ----ttyyppee==bbooooll will convert to ffaallssee.

       --config-env=<name>=<envvar>
           Like --cc <<nnaammee>>==<<vvaalluuee>>, give configuration variable _<_n_a_m_e_> a value, where <envvar> is the name of an environment
           variable from which to retrieve the value. Unlike --cc there is no shortcut for directly setting the value to an empty
           string, instead the environment variable itself must be set to the empty string. It is an error if the <<eennvvvvaarr>> does
           not exist in the environment.  <<eennvvvvaarr>> may not contain an equals sign to avoid ambiguity with <<nnaammee>> containing one.

           This is useful for cases where you want to pass transitory configuration options to git, but are doing so on OS’s where
           other processes might be able to read your cmdline (e.g.  //pprroocc//sseellff//ccmmddlliinnee), but not your environ (e.g.
           //pprroocc//sseellff//eennvviirroonn). That behavior is the default on Linux, but may not be on your system.

           Note that this might add security for variables such as hhttttpp..eexxttrraaHHeeaaddeerr where the sensitive information is part of the
           value, but not e.g.  uurrll..<<bbaassee>>..iinnsstteeaaddOOff where the sensitive information can be part of the key.

       --exec-path[=<path>]
           Path to wherever your core Git programs are installed. This can also be controlled by setting the GIT_EXEC_PATH
           environment variable. If no path is given, _g_i_t will print the current setting and then exit.

       --html-path
           Print the path, without trailing slash, where Git’s HTML documentation is installed and exit.

       --man-path
           Print the manpath (see mmaann((11))) for the man pages for this version of Git and exit.

       --info-path
           Print the path where the Info files documenting this version of Git are installed and exit.

       -p, --paginate
           Pipe all output into _l_e_s_s (or if set, $PAGER) if standard output is a terminal. This overrides the ppaaggeerr..<<ccmmdd>>
           configuration options (see the "Configuration Mechanism" section below).

       -P, --no-pager
           Do not pipe Git output into a pager.

       --git-dir=<path>
           Set the path to the repository (".git" directory). This can also be controlled by setting the GGIITT__DDIIRR environment
           variable. It can be an absolute path or relative path to current working directory.

           Specifying the location of the ".git" directory using this option (or GGIITT__DDIIRR environment variable) turns off the
           repository discovery that tries to find a directory with ".git" subdirectory (which is how the repository and the
           top-level of the working tree are discovered), and tells Git that you are at the top level of the working tree. If you
           are not at the top-level directory of the working tree, you should tell Git where the top-level of the working tree is,
           with the ----wwoorrkk--ttrreeee==<<ppaatthh>> option (or GGIITT__WWOORRKK__TTRREEEE environment variable)

           If you just want to run git as if it was started in <<ppaatthh>> then use ggiitt --CC <<ppaatthh>>.

       --work-tree=<path>
           Set the path to the working tree. It can be an absolute path or a path relative to the current working directory. This
           can also be controlled by setting the GIT_WORK_TREE environment variable and the core.worktree configuration variable
           (see core.worktree in ggiitt--ccoonnffiigg(1) for a more detailed discussion).

       --namespace=<path>
           Set the Git namespace. See ggiittnnaammeessppaacceess(7) for more details. Equivalent to setting the GGIITT__NNAAMMEESSPPAACCEE environment
           variable.

       --super-prefix=<path>
           Currently for internal use only. Set a prefix which gives a path from above a repository down to its root. One use is
           to give submodules context about the superproject that invoked it.

       --bare
           Treat the repository as a bare repository. If GIT_DIR environment is not set, it is set to the current working
           directory.

       --no-replace-objects
           Do not use replacement refs to replace Git objects. See ggiitt--rreeppllaaccee(1) for more information.

       --literal-pathspecs
           Treat pathspecs literally (i.e. no globbing, no pathspec magic). This is equivalent to setting the
           GGIITT__LLIITTEERRAALL__PPAATTHHSSPPEECCSS environment variable to 11.

       --glob-pathspecs
           Add "glob" magic to all pathspec. This is equivalent to setting the GGIITT__GGLLOOBB__PPAATTHHSSPPEECCSS environment variable to 11.
           Disabling globbing on individual pathspecs can be done using pathspec magic ":(literal)"

       --noglob-pathspecs
           Add "literal" magic to all pathspec. This is equivalent to setting the GGIITT__NNOOGGLLOOBB__PPAATTHHSSPPEECCSS environment variable to 11.
           Enabling globbing on individual pathspecs can be done using pathspec magic ":(glob)"

       --icase-pathspecs
           Add "icase" magic to all pathspec. This is equivalent to setting the GGIITT__IICCAASSEE__PPAATTHHSSPPEECCSS environment variable to 11.

       --no-optional-locks
           Do not perform optional operations that require locks. This is equivalent to setting the GGIITT__OOPPTTIIOONNAALL__LLOOCCKKSS to 00.

       --list-cmds=group[,group...]
           List commands by group. This is an internal/experimental option and may change or be removed in the future. Supported
           groups are: builtins, parseopt (builtin commands that use parse-options), main (all commands in libexec directory),
           others (all other commands in $$PPAATTHH that have git- prefix), list-<category> (see categories in command-list.txt),
           nohelpers (exclude helper commands), alias and config (retrieve command list from config variable completion.commands)

GGIITT CCOOMMMMAANNDDSS
       We divide Git into high level ("porcelain") commands and low level ("plumbing") commands.

HHIIGGHH--LLEEVVEELL CCOOMMMMAANNDDSS ((PPOORRCCEELLAAIINN))
       We separate the porcelain commands into the main commands and some ancillary user utilities.

   MMaaiinn ppoorrcceellaaiinn ccoommmmaannddss
       ggiitt--aadddd(1)
           Add file contents to the index.

       ggiitt--aamm(1)
           Apply a series of patches from a mailbox.

       ggiitt--aarrcchhiivvee(1)
           Create an archive of files from a named tree.

       ggiitt--bbiisseecctt(1)
           Use binary search to find the commit that introduced a bug.

       ggiitt--bbrraanncchh(1)
           List, create, or delete branches.

       ggiitt--bbuunnddllee(1)
           Move objects and refs by archive.

       ggiitt--cchheecckkoouutt(1)
           Switch branches or restore working tree files.

       ggiitt--cchheerrrryy--ppiicckk(1)
           Apply the changes introduced by some existing commits.

       ggiitt--cciittooooll(1)
           Graphical alternative to git-commit.

       ggiitt--cclleeaann(1)
           Remove untracked files from the working tree.

       ggiitt--cclloonnee(1)
           Clone a repository into a new directory.

       ggiitt--ccoommmmiitt(1)
           Record changes to the repository.

       ggiitt--ddeessccrriibbee(1)
           Give an object a human readable name based on an available ref.

       ggiitt--ddiiffff(1)
           Show changes between commits, commit and working tree, etc.

       ggiitt--ffeettcchh(1)
           Download objects and refs from another repository.

       ggiitt--ffoorrmmaatt--ppaattcchh(1)
           Prepare patches for e-mail submission.

       ggiitt--ggcc(1)
           Cleanup unnecessary files and optimize the local repository.

       ggiitt--ggrreepp(1)
           Print lines matching a pattern.

       ggiitt--gguuii(1)
           A portable graphical interface to Git.

       ggiitt--iinniitt(1)
           Create an empty Git repository or reinitialize an existing one.

       ggiitt--lloogg(1)
           Show commit logs.

       ggiitt--mmaaiinntteennaannccee(1)
           Run tasks to optimize Git repository data.

       ggiitt--mmeerrggee(1)
           Join two or more development histories together.

       ggiitt--mmvv(1)
           Move or rename a file, a directory, or a symlink.

       ggiitt--nnootteess(1)
           Add or inspect object notes.

       ggiitt--ppuullll(1)
           Fetch from and integrate with another repository or a local branch.

       ggiitt--ppuusshh(1)
           Update remote refs along with associated objects.

       ggiitt--rraannggee--ddiiffff(1)
           Compare two commit ranges (e.g. two versions of a branch).

       ggiitt--rreebbaassee(1)
           Reapply commits on top of another base tip.

       ggiitt--rreesseett(1)
           Reset current HEAD to the specified state.

       ggiitt--rreessttoorree(1)
           Restore working tree files.

       ggiitt--rreevveerrtt(1)
           Revert some existing commits.

       ggiitt--rrmm(1)
           Remove files from the working tree and from the index.

       ggiitt--sshhoorrttlloogg(1)
           Summarize _g_i_t _l_o_g output.

       ggiitt--sshhooww(1)
           Show various types of objects.

       ggiitt--ssppaarrssee--cchheecckkoouutt(1)
           Initialize and modify the sparse-checkout.

       ggiitt--ssttaasshh(1)
           Stash the changes in a dirty working directory away.

       ggiitt--ssttaattuuss(1)
           Show the working tree status.

       ggiitt--ssuubbmmoodduullee(1)
           Initialize, update or inspect submodules.

       ggiitt--sswwiittcchh(1)
           Switch branches.

       ggiitt--ttaagg(1)
           Create, list, delete or verify a tag object signed with GPG.

       ggiitt--wwoorrkkttrreeee(1)
           Manage multiple working trees.

       ggiittkk(1)
           The Git repository browser.

   AAnncciillllaarryy CCoommmmaannddss
       Manipulators:

       ggiitt--ccoonnffiigg(1)
           Get and set repository or global options.

       ggiitt--ffaasstt--eexxppoorrtt(1)
           Git data exporter.

       ggiitt--ffaasstt--iimmppoorrtt(1)
           Backend for fast Git data importers.

       ggiitt--ffiilltteerr--bbrraanncchh(1)
           Rewrite branches.

       ggiitt--mmeerrggeettooooll(1)
           Run merge conflict resolution tools to resolve merge conflicts.

       ggiitt--ppaacckk--rreeffss(1)
           Pack heads and tags for efficient repository access.

       ggiitt--pprruunnee(1)
           Prune all unreachable objects from the object database.

       ggiitt--rreefflloogg(1)
           Manage reflog information.

       ggiitt--rreemmoottee(1)
           Manage set of tracked repositories.

       ggiitt--rreeppaacckk(1)
           Pack unpacked objects in a repository.

       ggiitt--rreeppllaaccee(1)
           Create, list, delete refs to replace objects.

       Interrogators:

       ggiitt--aannnnoottaattee(1)
           Annotate file lines with commit information.

       ggiitt--bbllaammee(1)
           Show what revision and author last modified each line of a file.

       ggiitt--bbuuggrreeppoorrtt(1)
           Collect information for user to file a bug report.

       ggiitt--ccoouunntt--oobbjjeeccttss(1)
           Count unpacked number of objects and their disk consumption.

       ggiitt--ddiiffffttooooll(1)
           Show changes using common diff tools.

       ggiitt--ffsscckk(1)
           Verifies the connectivity and validity of the objects in the database.

       ggiitt--hheellpp(1)
           Display help information about Git.

       ggiitt--iinnssttaawweebb(1)
           Instantly browse your working repository in gitweb.

       ggiitt--mmeerrggee--ttrreeee(1)
           Show three-way merge without touching index.

       ggiitt--rreerreerree(1)
           Reuse recorded resolution of conflicted merges.

       ggiitt--sshhooww--bbrraanncchh(1)
           Show branches and their commits.

       ggiitt--vveerriiffyy--ccoommmmiitt(1)
           Check the GPG signature of commits.

       ggiitt--vveerriiffyy--ttaagg(1)
           Check the GPG signature of tags.

       ggiitt--wwhhaattcchhaannggeedd(1)
           Show logs with difference each commit introduces.

       ggiittwweebb(1)
           Git web interface (web frontend to Git repositories).

   IInntteerraaccttiinngg wwiitthh OOtthheerrss
       These commands are to interact with foreign SCM and with other people via patch over e-mail.

       ggiitt--aarrcchhiimmppoorrtt(1)
           Import a GNU Arch repository into Git.

       ggiitt--ccvvsseexxppoorrttccoommmmiitt(1)
           Export a single commit to a CVS checkout.

       ggiitt--ccvvssiimmppoorrtt(1)
           Salvage your data out of another SCM people love to hate.

       ggiitt--ccvvsssseerrvveerr(1)
           A CVS server emulator for Git.

       ggiitt--iimmaapp--sseenndd(1)
           Send a collection of patches from stdin to an IMAP folder.

       ggiitt--pp44(1)
           Import from and submit to Perforce repositories.

       ggiitt--qquuiillttiimmppoorrtt(1)
           Applies a quilt patchset onto the current branch.

       ggiitt--rreeqquueesstt--ppuullll(1)
           Generates a summary of pending changes.

       ggiitt--sseenndd--eemmaaiill(1)
           Send a collection of patches as emails.

       ggiitt--ssvvnn(1)
           Bidirectional operation between a Subversion repository and Git.

   RReesseett,, rreessttoorree aanndd rreevveerrtt
       There are three commands with similar names: ggiitt rreesseett, ggiitt rreessttoorree and ggiitt rreevveerrtt.

       •   ggiitt--rreevveerrtt(1) is about making a new commit that reverts the changes made by other commits.

       •   ggiitt--rreessttoorree(1) is about restoring files in the working tree from either the index or another commit. This command does
           not update your branch. The command can also be used to restore files in the index from another commit.

       •   ggiitt--rreesseett(1) is about updating your branch, moving the tip in order to add or remove commits from the branch. This
           operation changes the commit history.

           ggiitt rreesseett can also be used to restore the index, overlapping with ggiitt rreessttoorree.

LLOOWW--LLEEVVEELL CCOOMMMMAANNDDSS ((PPLLUUMMBBIINNGG))
       Although Git includes its own porcelain layer, its low-level commands are sufficient to support development of alternative
       porcelains. Developers of such porcelains might start by reading about ggiitt--uuppddaattee--iinnddeexx(1) and ggiitt--rreeaadd--ttrreeee(1).

       The interface (input, output, set of options and the semantics) to these low-level commands are meant to be a lot more
       stable than Porcelain level commands, because these commands are primarily for scripted use. The interface to Porcelain
       commands on the other hand are subject to change in order to improve the end user experience.

       The following description divides the low-level commands into commands that manipulate objects (in the repository, index,
       and working tree), commands that interrogate and compare objects, and commands that move objects and references between
       repositories.

   MMaanniippuullaattiioonn ccoommmmaannddss
       ggiitt--aappppllyy(1)
           Apply a patch to files and/or to the index.

       ggiitt--cchheecckkoouutt--iinnddeexx(1)
           Copy files from the index to the working tree.

       ggiitt--ccoommmmiitt--ggrraapphh(1)
           Write and verify Git commit-graph files.

       ggiitt--ccoommmmiitt--ttrreeee(1)
           Create a new commit object.

       ggiitt--hhaasshh--oobbjjeecctt(1)
           Compute object ID and optionally creates a blob from a file.

       ggiitt--iinnddeexx--ppaacckk(1)
           Build pack index file for an existing packed archive.

       ggiitt--mmeerrggee--ffiillee(1)
           Run a three-way file merge.

       ggiitt--mmeerrggee--iinnddeexx(1)
           Run a merge for files needing merging.

       ggiitt--mmkkttaagg(1)
           Creates a tag object with extra validation.

       ggiitt--mmkkttrreeee(1)
           Build a tree-object from ls-tree formatted text.

       ggiitt--mmuullttii--ppaacckk--iinnddeexx(1)
           Write and verify multi-pack-indexes.

       ggiitt--ppaacckk--oobbjjeeccttss(1)
           Create a packed archive of objects.

       ggiitt--pprruunnee--ppaacckkeedd(1)
           Remove extra objects that are already in pack files.

       ggiitt--rreeaadd--ttrreeee(1)
           Reads tree information into the index.

       ggiitt--ssyymmbboolliicc--rreeff(1)
           Read, modify and delete symbolic refs.

       ggiitt--uunnppaacckk--oobbjjeeccttss(1)
           Unpack objects from a packed archive.

       ggiitt--uuppddaattee--iinnddeexx(1)
           Register file contents in the working tree to the index.

       ggiitt--uuppddaattee--rreeff(1)
           Update the object name stored in a ref safely.

       ggiitt--wwrriittee--ttrreeee(1)
           Create a tree object from the current index.

   IInntteerrrrooggaattiioonn ccoommmmaannddss
       ggiitt--ccaatt--ffiillee(1)
           Provide content or type and size information for repository objects.

       ggiitt--cchheerrrryy(1)
           Find commits yet to be applied to upstream.

       ggiitt--ddiiffff--ffiilleess(1)
           Compares files in the working tree and the index.

       ggiitt--ddiiffff--iinnddeexx(1)
           Compare a tree to the working tree or index.

       ggiitt--ddiiffff--ttrreeee(1)
           Compares the content and mode of blobs found via two tree objects.

       ggiitt--ffoorr--eeaacchh--rreeff(1)
           Output information on each ref.

       ggiitt--ffoorr--eeaacchh--rreeppoo(1)
           Run a Git command on a list of repositories.

       ggiitt--ggeett--ttaarr--ccoommmmiitt--iidd(1)
           Extract commit ID from an archive created using git-archive.

       ggiitt--llss--ffiilleess(1)
           Show information about files in the index and the working tree.

       ggiitt--llss--rreemmoottee(1)
           List references in a remote repository.

       ggiitt--llss--ttrreeee(1)
           List the contents of a tree object.

       ggiitt--mmeerrggee--bbaassee(1)
           Find as good common ancestors as possible for a merge.

       ggiitt--nnaammee--rreevv(1)
           Find symbolic names for given revs.

       ggiitt--ppaacckk--rreedduunnddaanntt(1)
           Find redundant pack files.

       ggiitt--rreevv--lliisstt(1)
           Lists commit objects in reverse chronological order.

       ggiitt--rreevv--ppaarrssee(1)
           Pick out and massage parameters.

       ggiitt--sshhooww--iinnddeexx(1)
           Show packed archive index.

       ggiitt--sshhooww--rreeff(1)
           List references in a local repository.

       ggiitt--uunnppaacckk--ffiillee(1)
           Creates a temporary file with a blob’s contents.

       ggiitt--vvaarr(1)
           Show a Git logical variable.

       ggiitt--vveerriiffyy--ppaacckk(1)
           Validate packed Git archive files.

       In general, the interrogate commands do not touch the files in the working tree.

   SSyynncciinngg rreeppoossiittoorriieess
       ggiitt--ddaaeemmoonn(1)
           A really simple server for Git repositories.

       ggiitt--ffeettcchh--ppaacckk(1)
           Receive missing objects from another repository.

       ggiitt--hhttttpp--bbaacckkeenndd(1)
           Server side implementation of Git over HTTP.

       ggiitt--sseenndd--ppaacckk(1)
           Push objects over Git protocol to another repository.

       ggiitt--uuppddaattee--sseerrvveerr--iinnffoo(1)
           Update auxiliary info file to help dumb servers.

       The following are helper commands used by the above; end users typically do not use them directly.

       ggiitt--hhttttpp--ffeettcchh(1)
           Download from a remote Git repository via HTTP.

       ggiitt--hhttttpp--ppuusshh(1)
           Push objects over HTTP/DAV to another repository.

       ggiitt--rreecceeiivvee--ppaacckk(1)
           Receive what is pushed into the repository.

       ggiitt--sshheellll(1)
           Restricted login shell for Git-only SSH access.

       ggiitt--uuppllooaadd--aarrcchhiivvee(1)
           Send archive back to git-archive.

       ggiitt--uuppllooaadd--ppaacckk(1)
           Send objects packed back to git-fetch-pack.

   IInntteerrnnaall hheellppeerr ccoommmmaannddss
       These are internal helper commands used by other commands; end users typically do not use them directly.

       ggiitt--cchheecckk--aattttrr(1)
           Display gitattributes information.

       ggiitt--cchheecckk--iiggnnoorree(1)
           Debug gitignore / exclude files.

       ggiitt--cchheecckk--mmaaiillmmaapp(1)
           Show canonical names and email addresses of contacts.

       ggiitt--cchheecckk--rreeff--ffoorrmmaatt(1)
           Ensures that a reference name is well formed.

       ggiitt--ccoolluummnn(1)
           Display data in columns.

       ggiitt--ccrreeddeennttiiaall(1)
           Retrieve and store user credentials.

       ggiitt--ccrreeddeennttiiaall--ccaacchhee(1)
           Helper to temporarily store passwords in memory.

       ggiitt--ccrreeddeennttiiaall--ssttoorree(1)
           Helper to store credentials on disk.

       ggiitt--ffmmtt--mmeerrggee--mmssgg(1)
           Produce a merge commit message.

       ggiitt--iinntteerrpprreett--ttrraaiilleerrss(1)
           Add or parse structured information in commit messages.

       ggiitt--mmaaiilliinnffoo(1)
           Extracts patch and authorship from a single e-mail message.

       ggiitt--mmaaiillsspplliitt(1)
           Simple UNIX mbox splitter program.

       ggiitt--mmeerrggee--oonnee--ffiillee(1)
           The standard helper program to use with git-merge-index.

       ggiitt--ppaattcchh--iidd(1)
           Compute unique ID for a patch.

       ggiitt--sshh--ii1188nn(1)
           Git’s i18n setup code for shell scripts.

       ggiitt--sshh--sseettuupp(1)
           Common Git shell script setup code.

       ggiitt--ssttrriippssppaaccee(1)
           Remove unnecessary whitespace.

GGUUIIDDEESS
       The following documentation pages are guides about Git concepts.

       ggiittaattttrriibbuutteess(5)
           Defining attributes per path.

       ggiittccllii(7)
           Git command-line interface and conventions.

       ggiittccoorree--ttuuttoorriiaall(7)
           A Git core tutorial for developers.

       ggiittccrreeddeennttiiaallss(7)
           Providing usernames and passwords to Git.

       ggiittccvvss--mmiiggrraattiioonn(7)
           Git for CVS users.

       ggiittddiiffffccoorree(7)
           Tweaking diff output.

       ggiitteevveerryyddaayy(7)
           A useful minimum set of commands for Everyday Git.

       ggiittffaaqq(7)
           Frequently asked questions about using Git.

       ggiittgglloossssaarryy(7)
           A Git Glossary.

       ggiitthhooookkss(5)
           Hooks used by Git.

       ggiittiiggnnoorree(5)
           Specifies intentionally untracked files to ignore.

       ggiittmmaaiillmmaapp(5)
           Map author/committer names and/or E-Mail addresses.

       ggiittmmoodduulleess(5)
           Defining submodule properties.

       ggiittnnaammeessppaacceess(7)
           Git namespaces.

       ggiittrreemmoottee--hheellppeerrss(7)
           Helper programs to interact with remote repositories.

       ggiittrreeppoossiittoorryy--llaayyoouutt(5)
           Git Repository Layout.

       ggiittrreevviissiioonnss(7)
           Specifying revisions and ranges for Git.

       ggiittssuubbmmoodduulleess(7)
           Mounting one repository inside another.

       ggiittttuuttoorriiaall(7)
           A tutorial introduction to Git.

       ggiittttuuttoorriiaall--22(7)
           A tutorial introduction to Git: part two.

       ggiittwwoorrkkfflloowwss(7)
           An overview of recommended workflows with Git.

CCOONNFFIIGGUURRAATTIIOONN MMEECCHHAANNIISSMM
       Git uses a simple text format to store customizations that are per repository and are per user. Such a configuration file
       may look like this:

           #
           # A '#' or ';' character indicates a comment.
           #

           ; core variables
           [core]
                   ; Don't trust file modes
                   filemode = false

           ; user identity
           [user]
                   name = "Junio C Hamano"
                   email = "gitster@pobox.com"

       Various commands read from the configuration file and adjust their operation accordingly. See ggiitt--ccoonnffiigg(1) for a list and
       more details about the configuration mechanism.

IIDDEENNTTIIFFIIEERR TTEERRMMIINNOOLLOOGGYY
       <object>
           Indicates the object name for any type of object.

       <blob>
           Indicates a blob object name.

       <tree>
           Indicates a tree object name.

       <commit>
           Indicates a commit object name.

       <tree-ish>
           Indicates a tree, commit or tag object name. A command that takes a <tree-ish> argument ultimately wants to operate on
           a <tree> object but automatically dereferences <commit> and <tag> objects that point at a <tree>.

       <commit-ish>
           Indicates a commit or tag object name. A command that takes a <commit-ish> argument ultimately wants to operate on a
           <commit> object but automatically dereferences <tag> objects that point at a <commit>.

       <type>
           Indicates that an object type is required. Currently one of: bblloobb, ttrreeee, ccoommmmiitt, or ttaagg.

       <file>
           Indicates a filename - almost always relative to the root of the tree structure GGIITT__IINNDDEEXX__FFIILLEE describes.

SSYYMMBBOOLLIICC IIDDEENNTTIIFFIIEERRSS
       Any Git command accepting any <object> can also use the following symbolic notation:

       HEAD
           indicates the head of the current branch.

       <tag>
           a valid tag _n_a_m_e (i.e. a rreeffss//ttaaggss//<<ttaagg>> reference).

       <head>
           a valid head _n_a_m_e (i.e. a rreeffss//hheeaaddss//<<hheeaadd>> reference).

       For a more complete list of ways to spell object names, see "SPECIFYING REVISIONS" section in ggiittrreevviissiioonnss(7).

FFIILLEE//DDIIRREECCTTOORRYY SSTTRRUUCCTTUURREE
       Please see the ggiittrreeppoossiittoorryy--llaayyoouutt(5) document.

       Read ggiitthhooookkss(5) for more details about each hook.

       Higher level SCMs may provide and manage additional information in the $$GGIITT__DDIIRR.

TTEERRMMIINNOOLLOOGGYY
       Please see ggiittgglloossssaarryy(7).

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       Various Git commands use the following environment variables:

   TThhee GGiitt RReeppoossiittoorryy
       These environment variables apply to _a_l_l core Git commands. Nb: it is worth noting that they may be used/overridden by SCMS
       sitting above Git so take care if using a foreign front-end.

       GGIITT__IINNDDEEXX__FFIILLEE
           This environment allows the specification of an alternate index file. If not specified, the default of $$GGIITT__DDIIRR//iinnddeexx
           is used.

       GGIITT__IINNDDEEXX__VVEERRSSIIOONN
           This environment variable allows the specification of an index version for new repositories. It won’t affect existing
           index files. By default index file version 2 or 3 is used. See ggiitt--uuppddaattee--iinnddeexx(1) for more information.

       GGIITT__OOBBJJEECCTT__DDIIRREECCTTOORRYY
           If the object storage directory is specified via this environment variable then the sha1 directories are created
           underneath - otherwise the default $$GGIITT__DDIIRR//oobbjjeeccttss directory is used.

       GGIITT__AALLTTEERRNNAATTEE__OOBBJJEECCTT__DDIIRREECCTTOORRIIEESS
           Due to the immutable nature of Git objects, old objects can be archived into shared, read-only directories. This
           variable specifies a ":" separated (on Windows ";" separated) list of Git object directories which can be used to
           search for Git objects. New objects will not be written to these directories.

           Entries that begin with "" (double-quote) will be interpreted as C-style quoted paths, removing leading and trailing
           double-quotes and respecting backslash escapes. E.g., the value ""ppaatthh--wwiitthh--\\""--aanndd--::--iinn--iitt""::vvaanniillllaa--ppaatthh has two paths:
           ppaatthh--wwiitthh--""--aanndd--::--iinn--iitt and vvaanniillllaa--ppaatthh.

       GGIITT__DDIIRR
           If the GGIITT__DDIIRR environment variable is set then it specifies a path to use instead of the default ..ggiitt for the base of
           the repository. The ----ggiitt--ddiirr command-line option also sets this value.

       GGIITT__WWOORRKK__TTRREEEE
           Set the path to the root of the working tree. This can also be controlled by the ----wwoorrkk--ttrreeee command-line option and
           the core.worktree configuration variable.

       GGIITT__NNAAMMEESSPPAACCEE
           Set the Git namespace; see ggiittnnaammeessppaacceess(7) for details. The ----nnaammeessppaaccee command-line option also sets this value.

       GGIITT__CCEEIILLIINNGG__DDIIRREECCTTOORRIIEESS
           This should be a colon-separated list of absolute paths. If set, it is a list of directories that Git should not chdir
           up into while looking for a repository directory (useful for excluding slow-loading network directories). It will not
           exclude the current working directory or a GIT_DIR set on the command line or in the environment. Normally, Git has to
           read the entries in this list and resolve any symlink that might be present in order to compare them with the current
           directory. However, if even this access is slow, you can add an empty entry to the list to tell Git that the subsequent
           entries are not symlinks and needn’t be resolved; e.g., GGIITT__CCEEIILLIINNGG__DDIIRREECCTTOORRIIEESS==//mmaayybbee//ssyymmlliinnkk:::://vveerryy//ssllooww//nnoonn//ssyymmlliinnkk.

       GGIITT__DDIISSCCOOVVEERRYY__AACCRROOSSSS__FFIILLEESSYYSSTTEEMM
           When run in a directory that does not have ".git" repository directory, Git tries to find such a directory in the
           parent directories to find the top of the working tree, but by default it does not cross filesystem boundaries. This
           environment variable can be set to true to tell Git not to stop at filesystem boundaries. Like GGIITT__CCEEIILLIINNGG__DDIIRREECCTTOORRIIEESS,
           this will not affect an explicit repository directory set via GGIITT__DDIIRR or on the command line.

       GGIITT__CCOOMMMMOONN__DDIIRR
           If this variable is set to a path, non-worktree files that are normally in $GIT_DIR will be taken from this path
           instead. Worktree-specific files such as HEAD or index are taken from $GIT_DIR. See ggiittrreeppoossiittoorryy--llaayyoouutt(5) and ggiitt--
           wwoorrkkttrreeee(1) for details. This variable has lower precedence than other path variables such as GIT_INDEX_FILE,
           GIT_OBJECT_DIRECTORY...

       GGIITT__DDEEFFAAUULLTT__HHAASSHH
           If this variable is set, the default hash algorithm for new repositories will be set to this value. This value is
           currently ignored when cloning; the setting of the remote repository is used instead. The default is "sha1". THIS
           VARIABLE IS EXPERIMENTAL! See ----oobbjjeecctt--ffoorrmmaatt in ggiitt--iinniitt(1).

   GGiitt CCoommmmiittss
       GGIITT__AAUUTTHHOORR__NNAAMMEE
           The human-readable name used in the author identity when creating commit or tag objects, or when writing reflogs.
           Overrides the uusseerr..nnaammee and aauutthhoorr..nnaammee configuration settings.

       GGIITT__AAUUTTHHOORR__EEMMAAIILL
           The email address used in the author identity when creating commit or tag objects, or when writing reflogs. Overrides
           the uusseerr..eemmaaiill and aauutthhoorr..eemmaaiill configuration settings.

       GGIITT__AAUUTTHHOORR__DDAATTEE
           The date used for the author identity when creating commit or tag objects, or when writing reflogs. See ggiitt--ccoommmmiitt(1)
           for valid formats.

       GGIITT__CCOOMMMMIITTTTEERR__NNAAMMEE
           The human-readable name used in the committer identity when creating commit or tag objects, or when writing reflogs.
           Overrides the uusseerr..nnaammee and ccoommmmiitttteerr..nnaammee configuration settings.

       GGIITT__CCOOMMMMIITTTTEERR__EEMMAAIILL
           The email address used in the author identity when creating commit or tag objects, or when writing reflogs. Overrides
           the uusseerr..eemmaaiill and ccoommmmiitttteerr..eemmaaiill configuration settings.

       GGIITT__CCOOMMMMIITTTTEERR__DDAATTEE
           The date used for the committer identity when creating commit or tag objects, or when writing reflogs. See ggiitt--
           ccoommmmiitt(1) for valid formats.

       EEMMAAIILL
           The email address used in the author and committer identities if no other relevant environment variable or
           configuration setting has been set.

   GGiitt DDiiffffss
       GGIITT__DDIIFFFF__OOPPTTSS
           Only valid setting is "--unified=??" or "-u??" to set the number of context lines shown when a unified diff is created.
           This takes precedence over any "-U" or "--unified" option value passed on the Git diff command line.

       GGIITT__EEXXTTEERRNNAALL__DDIIFFFF
           When the environment variable GGIITT__EEXXTTEERRNNAALL__DDIIFFFF is set, the program named by it is called to generate diffs, and Git
           does not use its builtin diff machinery. For a path that is added, removed, or modified, GGIITT__EEXXTTEERRNNAALL__DDIIFFFF is called
           with 7 parameters:

               path old-file old-hex old-mode new-file new-hex new-mode

           where:

       <old|new>-file
           are files GIT_EXTERNAL_DIFF can use to read the contents of <old|new>,

       <old|new>-hex
           are the 40-hexdigit SHA-1 hashes,

       <old|new>-mode
           are the octal representation of the file modes.

           The file parameters can point at the user’s working file (e.g.  nneeww--ffiillee in "git-diff-files"), //ddeevv//nnuullll (e.g.
           oolldd--ffiillee when a new file is added), or a temporary file (e.g.  oolldd--ffiillee in the index).  GGIITT__EEXXTTEERRNNAALL__DDIIFFFF should not
           worry about unlinking the temporary file --- it is removed when GGIITT__EEXXTTEERRNNAALL__DDIIFFFF exits.

           For a path that is unmerged, GGIITT__EEXXTTEERRNNAALL__DDIIFFFF is called with 1 parameter, <path>.

           For each path GGIITT__EEXXTTEERRNNAALL__DDIIFFFF is called, two environment variables, GGIITT__DDIIFFFF__PPAATTHH__CCOOUUNNTTEERR and GGIITT__DDIIFFFF__PPAATTHH__TTOOTTAALL are
           set.

       GGIITT__DDIIFFFF__PPAATTHH__CCOOUUNNTTEERR
           A 1-based counter incremented by one for every path.

       GGIITT__DDIIFFFF__PPAATTHH__TTOOTTAALL
           The total number of paths.

   ootthheerr
       GGIITT__MMEERRGGEE__VVEERRBBOOSSIITTYY
           A number controlling the amount of output shown by the recursive merge strategy. Overrides merge.verbosity. See ggiitt--
           mmeerrggee(1)

       GGIITT__PPAAGGEERR
           This environment variable overrides $$PPAAGGEERR. If it is set to an empty string or to the value "cat", Git will not launch
           a pager. See also the ccoorree..ppaaggeerr option in ggiitt--ccoonnffiigg(1).

       GGIITT__PPRROOGGRREESSSS__DDEELLAAYY
           A number controlling how many seconds to delay before showing optional progress indicators. Defaults to 2.

       GGIITT__EEDDIITTOORR
           This environment variable overrides $$EEDDIITTOORR and $$VVIISSUUAALL. It is used by several Git commands when, on interactive mode,
           an editor is to be launched. See also ggiitt--vvaarr(1) and the ccoorree..eeddiittoorr option in ggiitt--ccoonnffiigg(1).

       GGIITT__SSEEQQUUEENNCCEE__EEDDIITTOORR
           This environment variable overrides the configured Git editor when editing the todo list of an interactive rebase. See
           also ggiitt--rreebbaassee(1) and the sseeqquueennccee..eeddiittoorr option in ggiitt--ccoonnffiigg(1).

       GGIITT__SSSSHH, GGIITT__SSSSHH__CCOOMMMMAANNDD
           If either of these environment variables is set then _g_i_t _f_e_t_c_h and _g_i_t _p_u_s_h will use the specified command instead of
           _s_s_h when they need to connect to a remote system. The command-line parameters passed to the configured command are
           determined by the ssh variant. See sssshh..vvaarriiaanntt option in ggiitt--ccoonnffiigg(1) for details.

           $$GGIITT__SSSSHH__CCOOMMMMAANNDD takes precedence over $$GGIITT__SSSSHH, and is interpreted by the shell, which allows additional arguments to
           be included.  $$GGIITT__SSSSHH on the other hand must be just the path to a program (which can be a wrapper shell script, if
           additional arguments are needed).

           Usually it is easier to configure any desired options through your personal ..sssshh//ccoonnffiigg file. Please consult your ssh
           documentation for further details.

       GGIITT__SSSSHH__VVAARRIIAANNTT
           If this environment variable is set, it overrides Git’s autodetection whether GGIITT__SSSSHH/GGIITT__SSSSHH__CCOOMMMMAANNDD/ccoorree..sssshhCCoommmmaanndd
           refer to OpenSSH, plink or tortoiseplink. This variable overrides the config setting sssshh..vvaarriiaanntt that serves the same
           purpose.

       GGIITT__AASSKKPPAASSSS
           If this environment variable is set, then Git commands which need to acquire passwords or passphrases (e.g. for HTTP or
           IMAP authentication) will call this program with a suitable prompt as command-line argument and read the password from
           its STDOUT. See also the ccoorree..aasskkPPaassss option in ggiitt--ccoonnffiigg(1).

       GGIITT__TTEERRMMIINNAALL__PPRROOMMPPTT
           If this environment variable is set to 00, git will not prompt on the terminal (e.g., when asking for HTTP
           authentication).

       GGIITT__CCOONNFFIIGG__GGLLOOBBAALL, GGIITT__CCOONNFFIIGG__SSYYSSTTEEMM
           Take the configuration from the given files instead from global or system-level configuration files. If
           GGIITT__CCOONNFFIIGG__SSYYSSTTEEMM is set, the system config file defined at build time (usually //eettcc//ggiittccoonnffiigg) will not be read.
           Likewise, if GGIITT__CCOONNFFIIGG__GGLLOOBBAALL is set, neither $$HHOOMMEE//..ggiittccoonnffiigg nor $$XXDDGG__CCOONNFFIIGG__HHOOMMEE//ggiitt//ccoonnffiigg will be read. Can be
           set to //ddeevv//nnuullll to skip reading configuration files of the respective level.

       GGIITT__CCOONNFFIIGG__NNOOSSYYSSTTEEMM
           Whether to skip reading settings from the system-wide $$((pprreeffiixx))//eettcc//ggiittccoonnffiigg file. This environment variable can be
           used along with $$HHOOMMEE and $$XXDDGG__CCOONNFFIIGG__HHOOMMEE to create a predictable environment for a picky script, or you can set it
           temporarily to avoid using a buggy //eettcc//ggiittccoonnffiigg file while waiting for someone with sufficient permissions to fix it.

       GGIITT__FFLLUUSSHH
           If this environment variable is set to "1", then commands such as _g_i_t _b_l_a_m_e (in incremental mode), _g_i_t _r_e_v_-_l_i_s_t, _g_i_t
           _l_o_g, _g_i_t _c_h_e_c_k_-_a_t_t_r and _g_i_t _c_h_e_c_k_-_i_g_n_o_r_e will force a flush of the output stream after each record have been flushed.
           If this variable is set to "0", the output of these commands will be done using completely buffered I/O. If this
           environment variable is not set, Git will choose buffered or record-oriented flushing based on whether stdout appears
           to be redirected to a file or not.

       GGIITT__TTRRAACCEE
           Enables general trace messages, e.g. alias expansion, built-in command execution and external command execution.

           If this variable is set to "1", "2" or "true" (comparison is case insensitive), trace messages will be printed to
           stderr.

           If the variable is set to an integer value greater than 2 and lower than 10 (strictly) then Git will interpret this
           value as an open file descriptor and will try to write the trace messages into this file descriptor.

           Alternatively, if the variable is set to an absolute path (starting with a _/ character), Git will interpret this as a
           file path and will try to append the trace messages to it.

           Unsetting the variable, or setting it to empty, "0" or "false" (case insensitive) disables trace messages.

       GGIITT__TTRRAACCEE__FFSSMMOONNIITTOORR
           Enables trace messages for the filesystem monitor extension. See GGIITT__TTRRAACCEE for available trace output options.

       GGIITT__TTRRAACCEE__PPAACCKK__AACCCCEESSSS
           Enables trace messages for all accesses to any packs. For each access, the pack file name and an offset in the pack is
           recorded. This may be helpful for troubleshooting some pack-related performance problems. See GGIITT__TTRRAACCEE for available
           trace output options.

       GGIITT__TTRRAACCEE__PPAACCKKEETT
           Enables trace messages for all packets coming in or out of a given program. This can help with debugging object
           negotiation or other protocol issues. Tracing is turned off at a packet starting with "PACK" (but see
           GGIITT__TTRRAACCEE__PPAACCKKFFIILLEE below). See GGIITT__TTRRAACCEE for available trace output options.

       GGIITT__TTRRAACCEE__PPAACCKKFFIILLEE
           Enables tracing of packfiles sent or received by a given program. Unlike other trace output, this trace is verbatim: no
           headers, and no quoting of binary data. You almost certainly want to direct into a file (e.g.,
           GGIITT__TTRRAACCEE__PPAACCKKFFIILLEE==//ttmmpp//mmyy..ppaacckk) rather than displaying it on the terminal or mixing it with other trace output.

           Note that this is currently only implemented for the client side of clones and fetches.

       GGIITT__TTRRAACCEE__PPEERRFFOORRMMAANNCCEE
           Enables performance related trace messages, e.g. total execution time of each Git command. See GGIITT__TTRRAACCEE for available
           trace output options.

       GGIITT__TTRRAACCEE__RREEFFSS
           Enables trace messages for operations on the ref database. See GGIITT__TTRRAACCEE for available trace output options.

       GGIITT__TTRRAACCEE__SSEETTUUPP
           Enables trace messages printing the .git, working tree and current working directory after Git has completed its setup
           phase. See GGIITT__TTRRAACCEE for available trace output options.

       GGIITT__TTRRAACCEE__SSHHAALLLLOOWW
           Enables trace messages that can help debugging fetching / cloning of shallow repositories. See GGIITT__TTRRAACCEE for available
           trace output options.

       GGIITT__TTRRAACCEE__CCUURRLL
           Enables a curl full trace dump of all incoming and outgoing data, including descriptive information, of the git
           transport protocol. This is similar to doing curl ----ttrraaccee--aasscciiii on the command line. See GGIITT__TTRRAACCEE for available trace
           output options.

       GGIITT__TTRRAACCEE__CCUURRLL__NNOO__DDAATTAA
           When a curl trace is enabled (see GGIITT__TTRRAACCEE__CCUURRLL above), do not dump data (that is, only dump info lines and headers).

       GGIITT__TTRRAACCEE22
           Enables more detailed trace messages from the "trace2" library. Output from GGIITT__TTRRAACCEE22 is a simple text-based format
           for human readability.

           If this variable is set to "1", "2" or "true" (comparison is case insensitive), trace messages will be printed to
           stderr.

           If the variable is set to an integer value greater than 2 and lower than 10 (strictly) then Git will interpret this
           value as an open file descriptor and will try to write the trace messages into this file descriptor.

           Alternatively, if the variable is set to an absolute path (starting with a _/ character), Git will interpret this as a
           file path and will try to append the trace messages to it. If the path already exists and is a directory, the trace
           messages will be written to files (one per process) in that directory, named according to the last component of the SID
           and an optional counter (to avoid filename collisions).

           In addition, if the variable is set to aaff__uunniixx::[[<<ssoocckkeett__ttyyppee>>::]]<<aabbssoolluuttee--ppaatthhnnaammee>>, Git will try to open the path as a
           Unix Domain Socket. The socket type can be either ssttrreeaamm or ddggrraamm.

           Unsetting the variable, or setting it to empty, "0" or "false" (case insensitive) disables trace messages.

           See TTrraaccee22 ddooccuummeennttaattiioonn[2] for full details.

       GGIITT__TTRRAACCEE22__EEVVEENNTT
           This setting writes a JSON-based format that is suited for machine interpretation. See GGIITT__TTRRAACCEE22 for available trace
           output options and TTrraaccee22 ddooccuummeennttaattiioonn[2] for full details.

       GGIITT__TTRRAACCEE22__PPEERRFF
           In addition to the text-based messages available in GGIITT__TTRRAACCEE22, this setting writes a column-based format for
           understanding nesting regions. See GGIITT__TTRRAACCEE22 for available trace output options and TTrraaccee22 ddooccuummeennttaattiioonn[2] for full
           details.

       GGIITT__TTRRAACCEE__RREEDDAACCTT
           By default, when tracing is activated, Git redacts the values of cookies, the "Authorization:" header, and the
           "Proxy-Authorization:" header. Set this variable to 00 to prevent this redaction.

       GGIITT__LLIITTEERRAALL__PPAATTHHSSPPEECCSS
           Setting this variable to 11 will cause Git to treat all pathspecs literally, rather than as glob patterns. For example,
           running GGIITT__LLIITTEERRAALL__PPAATTHHSSPPEECCSS==11 ggiitt lloogg ---- ''**..cc'' will search for commits that touch the path **..cc, not any paths that
           the glob **..cc matches. You might want this if you are feeding literal paths to Git (e.g., paths previously given to you
           by ggiitt llss--ttrreeee, ----rraaww diff output, etc).

       GGIITT__GGLLOOBB__PPAATTHHSSPPEECCSS
           Setting this variable to 11 will cause Git to treat all pathspecs as glob patterns (aka "glob" magic).

       GGIITT__NNOOGGLLOOBB__PPAATTHHSSPPEECCSS
           Setting this variable to 11 will cause Git to treat all pathspecs as literal (aka "literal" magic).

       GGIITT__IICCAASSEE__PPAATTHHSSPPEECCSS
           Setting this variable to 11 will cause Git to treat all pathspecs as case-insensitive.

       GGIITT__RREEFFLLOOGG__AACCTTIIOONN
           When a ref is updated, reflog entries are created to keep track of the reason why the ref was updated (which is
           typically the name of the high-level command that updated the ref), in addition to the old and new values of the ref. A
           scripted Porcelain command can use set_reflog_action helper function in ggiitt--sshh--sseettuupp to set its name to this variable
           when it is invoked as the top level command by the end user, to be recorded in the body of the reflog.

       GGIITT__RREEFF__PPAARRAANNOOIIAA
           If set to 00, ignore broken or badly named refs when iterating over lists of refs. Normally Git will try to include any
           such refs, which may cause some operations to fail. This is usually preferable, as potentially destructive operations
           (e.g., ggiitt--pprruunnee(1)) are better off aborting rather than ignoring broken refs (and thus considering the history they
           point to as not worth saving). The default value is 11 (i.e., be paranoid about detecting and aborting all operations).
           You should not normally need to set this to 00, but it may be useful when trying to salvage data from a corrupted
           repository.

       GGIITT__AALLLLOOWW__PPRROOTTOOCCOOLL
           If set to a colon-separated list of protocols, behave as if pprroottooccooll..aallllooww is set to nneevveerr, and each of the listed
           protocols has pprroottooccooll..<<nnaammee>>..aallllooww set to aallwwaayyss (overriding any existing configuration). In other words, any protocol
           not mentioned will be disallowed (i.e., this is a whitelist, not a blacklist). See the description of pprroottooccooll..aallllooww in
           ggiitt--ccoonnffiigg(1) for more details.

       GGIITT__PPRROOTTOOCCOOLL__FFRROOMM__UUSSEERR
           Set to 0 to prevent protocols used by fetch/push/clone which are configured to the uusseerr state. This is useful to
           restrict recursive submodule initialization from an untrusted repository or for programs which feed
           potentially-untrusted URLS to git commands. See ggiitt--ccoonnffiigg(1) for more details.

       GGIITT__PPRROOTTOOCCOOLL
           For internal use only. Used in handshaking the wire protocol. Contains a colon _: separated list of keys with optional
           values _k_e_y_[_=_v_a_l_u_e_]. Presence of unknown keys and values must be ignored.

           Note that servers may need to be configured to allow this variable to pass over some transports. It will be propagated
           automatically when accessing local repositories (i.e., ffiillee:://// or a filesystem path), as well as over the ggiitt::////
           protocol. For git-over-http, it should work automatically in most configurations, but see the discussion in ggiitt--hhttttpp--
           bbaacckkeenndd(1). For git-over-ssh, the ssh server may need to be configured to allow clients to pass this variable (e.g., by
           using AAcccceeppttEEnnvv GGIITT__PPRROOTTOOCCOOLL with OpenSSH).

           This configuration is optional. If the variable is not propagated, then clients will fall back to the original "v0"
           protocol (but may miss out on some performance improvements or features). This variable currently only affects clones
           and fetches; it is not yet used for pushes (but may be in the future).

       GGIITT__OOPPTTIIOONNAALL__LLOOCCKKSS
           If set to 00, Git will complete any requested operation without performing any optional sub-operations that require
           taking a lock. For example, this will prevent ggiitt ssttaattuuss from refreshing the index as a side effect. This is useful for
           processes running in the background which do not want to cause lock contention with other operations on the repository.
           Defaults to 11.

       GGIITT__RREEDDIIRREECCTT__SSTTDDIINN, GGIITT__RREEDDIIRREECCTT__SSTTDDOOUUTT, GGIITT__RREEDDIIRREECCTT__SSTTDDEERRRR
           Windows-only: allow redirecting the standard input/output/error handles to paths specified by the environment
           variables. This is particularly useful in multi-threaded applications where the canonical way to pass standard handles
           via CCrreeaatteePPrroocceessss(()) is not an option because it would require the handles to be marked inheritable (and consequently
           eevveerryy spawned process would inherit them, possibly blocking regular Git operations). The primary intended use case is
           to use named pipes for communication (e.g.  \\\\..\\ppiippee\\mmyy--ggiitt--ssttddiinn--112233).

           Two special values are supported: ooffff will simply close the corresponding standard handle, and if GGIITT__RREEDDIIRREECCTT__SSTTDDEERRRR
           is 22>>&&11, standard error will be redirected to the same handle as standard output.

       GGIITT__PPRRIINNTT__SSHHAA11__EELLLLIIPPSSIISS (deprecated)
           If set to yyeess, print an ellipsis following an (abbreviated) SHA-1 value. This affects indications of detached HEADs
           (ggiitt--cchheecckkoouutt(1)) and the raw diff output (ggiitt--ddiiffff(1)). Printing an ellipsis in the cases mentioned is no longer
           considered adequate and support for it is likely to be removed in the foreseeable future (along with the variable).

DDIISSCCUUSSSSIIOONN
       More detail on the following is available from the GGiitt ccoonncceeppttss cchhaapptteerr ooff tthhee uusseerr--mmaannuuaall[3] and ggiittccoorree--ttuuttoorriiaall(7).

       A Git project normally consists of a working directory with a ".git" subdirectory at the top level. The .git directory
       contains, among other things, a compressed object database representing the complete history of the project, an "index"
       file which links that history to the current contents of the working tree, and named pointers into that history such as
       tags and branch heads.

       The object database contains objects of three main types: blobs, which hold file data; trees, which point to blobs and
       other trees to build up directory hierarchies; and commits, which each reference a single tree and some number of parent
       commits.

       The commit, equivalent to what other systems call a "changeset" or "version", represents a step in the project’s history,
       and each parent represents an immediately preceding step. Commits with more than one parent represent merges of independent
       lines of development.

       All objects are named by the SHA-1 hash of their contents, normally written as a string of 40 hex digits. Such names are
       globally unique. The entire history leading up to a commit can be vouched for by signing just that commit. A fourth object
       type, the tag, is provided for this purpose.

       When first created, objects are stored in individual files, but for efficiency may later be compressed together into "pack
       files".

       Named pointers called refs mark interesting points in history. A ref may contain the SHA-1 name of an object or the name of
       another ref. Refs with names beginning rreeff//hheeaadd// contain the SHA-1 name of the most recent commit (or "head") of a branch
       under development. SHA-1 names of tags of interest are stored under rreeff//ttaaggss//. A special ref named HHEEAADD contains the name
       of the currently checked-out branch.

       The index file is initialized with a list of all paths and, for each path, a blob object and a set of attributes. The blob
       object represents the contents of the file as of the head of the current branch. The attributes (last modified time, size,
       etc.) are taken from the corresponding file in the working tree. Subsequent changes to the working tree can be found by
       comparing these attributes. The index may be updated with new content, and new commits may be created from the content
       stored in the index.

       The index is also capable of storing multiple entries (called "stages") for a given pathname. These stages are used to hold
       the various unmerged version of a file when a merge is in progress.

FFUURRTTHHEERR DDOOCCUUMMEENNTTAATTIIOONN
       See the references in the "description" section to get started using Git. The following is probably more detail than
       necessary for a first-time user.

       The GGiitt ccoonncceeppttss cchhaapptteerr ooff tthhee uusseerr--mmaannuuaall[3] and ggiittccoorree--ttuuttoorriiaall(7) both provide introductions to the underlying Git
       architecture.

       See ggiittwwoorrkkfflloowwss(7) for an overview of recommended workflows.

       See also the hhoowwttoo[4] documents for some useful examples.

       The internals are documented in the GGiitt AAPPII ddooccuummeennttaattiioonn[5].

       Users migrating from CVS may also want to read ggiittccvvss--mmiiggrraattiioonn(7).

AAUUTTHHOORRSS
       Git was started by Linus Torvalds, and is currently maintained by Junio C Hamano. Numerous contributions have come from the
       Git mailing list <ggiitt@@vvggeerr..kkeerrnneell..oorrgg[6]>. hhttttpp::////wwwwww..ooppeennhhuubb..nneett//pp//ggiitt//ccoonnttrriibbuuttoorrss//ssuummmmaarryy gives you a more complete list
       of contributors.

       If you have a clone of git.git itself, the output of ggiitt--sshhoorrttlloogg(1) and ggiitt--bbllaammee(1) can show you the authors for specific
       parts of the project.

RREEPPOORRTTIINNGG BBUUGGSS
       Report bugs to the Git mailing list <ggiitt@@vvggeerr..kkeerrnneell..oorrgg[6]> where the development and maintenance is primarily done. You
       do not have to be subscribed to the list to send a message there. See the list archive at hhttttppss::////lloorree..kkeerrnneell..oorrgg//ggiitt for
       previous bug reports and other discussions.

       Issues which are security relevant should be disclosed privately to the Git Security mailing list
       <ggiitt--sseeccuurriittyy@@ggoooogglleeggrroouuppss..ccoomm[7]>.

SSEEEE AALLSSOO
       ggiittttuuttoorriiaall(7), ggiittttuuttoorriiaall--22(7), ggiitteevveerryyddaayy(7), ggiittccvvss--mmiiggrraattiioonn(7), ggiittgglloossssaarryy(7), ggiittccoorree--ttuuttoorriiaall(7), ggiittccllii(7), TThhee
       GGiitt UUsseerr’’ss MMaannuuaall[1], ggiittwwoorrkkfflloowwss(7)

GGIITT
       Part of the ggiitt(1) suite

NNOOTTEESS
        1. Git User’s Manual
           file:///usr/share/doc/git/html/user-manual.html

        2. Trace2 documentation
           file:///usr/share/doc/git/html/technical/api-trace2.html

        3. Git concepts chapter of the user-manual
           file:///usr/share/doc/git/html/user-manual.html#git-concepts

        4. howto
           file:///usr/share/doc/git/html/howto-index.html

        5. Git API documentation
           file:///usr/share/doc/git/html/technical/api-index.html

        6. git@vger.kernel.org
           mailto:git@vger.kernel.org

        7. git-security@googlegroups.com
           mailto:git-security@googlegroups.com

Git 2.34.1                                                  07/07/2023                                                      GIT(1)

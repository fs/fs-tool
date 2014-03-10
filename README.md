fs
==========================================================================

A legendary command-line tool whose kung fu skills were the stuff of legend.


## Installation

```bash
git clone git@github.com:fs/fs-tool.git ~/.fs-tool
```

Bash users:

```bash
echo 'eval "$($HOME/.fs-tool/bin/fs init -)"' >> ~/.bash_profile
exec bash
```

Zsh users:

```bash
echo 'eval "$($HOME/.fs-tool/bin/fs init -)"' >> ~/.zshenv
source ~/.zshenv
```


## Commands

Run `fs` without any arguments or run `fs help` to explore available commands.
`fs help <command_name>` prints usage and other command documentation.

### `fs wisdom` (`fs wise`)

Shares the best wisdom quotes and our core values with you.

```bash
$ fs wisdom
Great Work is a Matter of Pride
```

### `fs gh`

Open current github repo in browser

```bash
$ fs gh                           # opens current repo on github
$ fs gh pulls (fs gh p)           # opens current repo's pull requests on github
$ fs gh issues (fs gh i)          # opens current repo's issues on github
$ fs gh pulls new (fs gh p n)     # opens new pull request in current repo on github
$ fs gh issues new (fs gh i n)    # opens new issue in current repo on github
$ fs gh pulls closed (fs gh p c)  # opens current repo's closed pull requests on github
$ fs gh issues closed (fs gh i c) # opens current repo's closed issues on github
$ fs gh search (fs gh s) <query>  # searches in current repo
$ fs gh show <commit_id>          # opens commit <commit_id> on github
```

### `fs setup` (`fs bootstrap`)

Bootstrap new project from fs/xxx-base templates

```bash
$ fs setup rails <project name>  # setup new project using rails-base template
$ fs setup api <project name>    # setup new project using rails-base-api template
$ fs setup static <project name> # setup new project using static-base template
```

### `fs h` (`fs guide`)

Open corresponding guides' section in browser. If section is not found
then search through the guides.


```bash
$ fs h style                     # opens "Style Guide"
$ fs h code review               # opens "Code Review"
$ fs h heroku                    # opens "Deploy to Heroku"
$ fs h new project               # opens "Create new project from scratch"
$ fs h I am no longer young      # searches "I am no longer young" in the guides
```

See available sections in command autocompletion:

```bash
$ fs h <TAB><TAB>
aws               dns               logentries        openspace_rules   semaphore
basecamp          github            maintain          pagerduty         style
bug_report        google_apps       maintain_project  passpack          style_guide
bug_reports       heroku            network           pingdom           workflow
code_review       hipchat           new_project       printer
communicate       infrastructure    open_space_rules  printers
communication     learn             openspace         rollbar
```

### Remote commands

Remote commands use per-user or per-project server configuration
stored in `.fs.yml`, for example:

```yaml
# .fs.yml
servers:
 default: &default
   address: me@startup.com
   environment: staging
   root: /data/application
 staging:
   <<: *default
 staging_2:
   <<: *default
   address: me@startup-s2.com
```

Global configuration:

```yaml
# ~/.fs.yml
servers:
  home:
    address: foo@stark.geocities.com
    environment: staging
    root: /var/www/stark
  'home production':
    address: foo@wayne.geocities.com
    root: /var/www/wayne
    environment: production
```

#### `fs ssh`

Open SSH session to a given application (environment).

```bash
$ fs ssh                 # opens SSH session to me@startup.com
$ fs ssh staging_2       # opens SSH session to me@startup-s2.com
$ fs ssh home            # opens SSH session foo@stark.geocities.com
$ fs ssh home production # opens SSH session foo@wayne.geocities.com
```

### Other commands

```bash
$ fs news                        # opens Flatstack news feed on github
$ fs teams (fs team)             # opens Flatstack teams management on github
$ fs issues                      # opens Flatstack issues on github
$ fs pulls (fs prs)              # opens public Flastack pull requests on github
$ fs pulls private               # opens private Flatstack pull requests on github
```

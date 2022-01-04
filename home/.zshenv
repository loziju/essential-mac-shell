# -------------------------------
# 1.  ENVIRONMENT CONFIGURATION
# -------------------------------

# Change Prompt
# @see https://medium.com/@morkett89/customising-the-terminal-d3d307b0ec8d
# ------------------------------------------------------------

# Set Paths for Composer
# Unlike the suggestion by composer / cgr, $PATH is defined first so that drush
# launcher takes priority compared to the default drush installed by composer /
# cgr.
# ------------------------------------------------------------
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Set Default Editor (vim FTW!)
# ------------------------------------------------------------
export EDITOR=/usr/bin/vim

# Set default blocksize for ls, df, du
# @see http://hints.macworld.com/comment.php?mode=view&cid=24491
# ------------------------------------------------------------
export BLOCKSIZE=1k

# Homebrew github
# 1. Visit https://github.com/settings/tokens/new
# 2. Fill in “Homebrew” in the Note field, change expiration to No expiration,
#    and click the Generate token button
# 3. Copy the generated token and populate it below:
export HOMEBREW_GITHUB_API_TOKEN=""

# Drush launcher fallback.
export DRUSH_LAUNCHER_FALLBACK=$HOME/.composer/vendor/bin/drush

# -------------------------------
# 2.  SET ALIASES
# -------------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll="ls -alGhFp"
alias ls="ls -G"

# AWS hosting shortcut
alias aws='ssh -l ubuntu ec2-127-0-0-1.ap-southeast-1.compute.amazonaws.com -i $HOME/.ssh/id_rsa.pem'

# Other applications
#alias mou='open /Applications/Mou.app'
#alias apachesolr='java -jar /usr/local/Cellar/solr/3.6.2/libexec/drupal_apachesolr/start.jar'
#alias solrsearchapi='java -jar /usr/local/Cellar/solr/3.6.2/libexec/drupal_search_api/start.jar'
#alias mongo_start='sudo launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist'
#alias mongo_stop='sudo launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist'

# cURL
function curlh() { curl -sLIXGET "$@"; }
function curlc() { curl -sLIXGET "$@" | grep -E -i "^(Cache-Control|Age|Expires|Set-Cookie|X-Cache|X-Varnish|X-Hits|Vary)"; }

# Drupal Pantheon rsync
# @see https://pantheon.io/docs/rsync-and-sftp#rsync
project-rsync() {
  rsync -rlvz --size-only --ipv4 --progress -e 'ssh -p 2222' $2/* --temp-dir=../tmp/ $1.some-uuid@appserver.$1.some-uuid.drush.in:files/
}

# -------------------------------
# 3.  Other stuff
# -------------------------------

# For drupal console autocomplete
source "$HOME/.console/console.rc" 2>/dev/null

# Set unlimited memory limit for composer
export COMPOSER_MEMORY_LIMIT=-1

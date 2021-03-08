
# -------------------------------
# 1.  ENVIRONMENT CONFIGURATION
# -------------------------------

# Change Prompt
# @see https://medium.com/@morkett89/customising-the-terminal-d3d307b0ec8d
# ------------------------------------------------------------

# Set Paths for Composer
# ------------------------------------------------------------
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Set Default Editor (change 'Nano' to the editor of your choice)
# ------------------------------------------------------------
export EDITOR=/usr/bin/vim

# Set default blocksize for ls, df, du
# @see http://hints.macworld.com/comment.php?mode=view&cid=24491
# ------------------------------------------------------------
export BLOCKSIZE=1k

# Homebrew github
# 1. Visit https://github.com/settings/tokens/new
# 2. Fill in “Homebrew” in the Note field and click the Generate token button
# 3. Copy the generated token and populate it below:
export HOMEBREW_GITHUB_API_TOKEN="insert_your_token_here"

# Platform.sh CLI configuration
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET
# Alternative Platform.sh token authentication
# export PLATFORMSH_CLI_TOKEN=insert_your_token_here

# To make nvm installed through homebrew to work
#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

# -------------------------------
# 2.  SET ALIASES
# -------------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll="ls -alGhFp"
alias ls="ls -G"
alias which='type -all'

# AWS hosting shortcut
alias aws='ssh -l ubuntu ec2-127-0-0-1.ap-southeast-1.compute.amazonaws.com -i $HOME/.ssh/id_rsa.pem'

# Other aplications
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

# For homebrew bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# To enable forward bash reverse search by pressing ctrl+s in the midst of doing ctrl+r
# https://ask.fedoraproject.org/en/question/10685/bash-reverse-search-ctrlr-going-forward/
stty -ixon

# For drupal console autocomplete
source "$HOME/.console/console.rc" 2>/dev/null

# Not sure why iterm2 added the following
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

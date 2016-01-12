# aliases
alias ll='ls -lh'
alias la='ls -a'
alias vi='vim'

# environment
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim
export SCALA_HOME=/Users/lalford/development/scala/scala-2.11.2
export ACTIVATOR_HOME=/Users/lalford/development/tools/activator-dist-1.3.5
#export PATH=$PATH
#:/Users/lalford/development/scala/play-2.1-RC2

# iterm2 dirname in title
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

## sbt launcher function
sbt() {
  echo "bash_profile sbt function running..."
  SBT_DEFAULTS="-Xms1024M -Xmx3072M"
  #SBT_DEBUG="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
  SBT_EXPERIMENTAL="-XX:+UseCodeCacheFlushing -XX:ReservedCodeCacheSize=512m -XX:+UseCompressedOops"
  SBT_OPTS="${SBT_DEFAULTS} ${SBT_DEBUG} ${SBT_EXPERIMENTAL}"
  java $SBT_OPTS -jar /usr/local/Cellar/sbt/0.13.7/libexec/sbt-launch.jar
}

# custom ssh-copy-id because this doesn't exist on mac os x bash
sshcopyid() {
  cat ~/.ssh/id_rsa.pub | ssh $1 "if [ ! -d ~/.ssh ]; then mkdir -p ~/.ssh; fi; cat >> ~/.ssh/authorized_keys"
}

# ruby
[[ -s "/Users/lalford/.rvm/scripts/rvm" ]] && source "/Users/lalford/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

RUBY_VER="1.9.3"

# homeserver tunnel
ssh-homeserver() {
  ssh -D 13579 lalford@homeserver
}

# ssh key
ssh-add-id() {
  ssh-add ~/.ssh/id_rsa
}

# pull in anything else from bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# start/stop nginx
nginx-load() {
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
}

nginx-unload() {
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
}

# start/stop mysql
mysql-load() {
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
}

mysql-unload() {
  launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
}

mysql-debug() {
  mysqld --general-log --general-log-file=/Users/lalford/development/mysql.log &
}

# start/stop mongo
mongo-load() {
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
}

mongo-unload() {
  launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
}

# start/stop postgres
pg-load() {
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist  
}

pg-unload() {
  launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist  
} 

# start/stop rabbitmq
rabbitmq-load() {
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
}

rabbitmq-unload() {
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
}

# IBM Heap Analyzer
heap-analyzer() {
  java -Xmx4g -jar ~/development/tools/ha454.jar
}

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$SCALA_HOME/bin
#export PATH=/usr/local/bin:/usr/local/heroku/bin:/Users/lalford/.rvm/gems/ruby-1.9.3-p362/bin:/Users/lalford/.rvm/gems/ruby-1.9.3-p362@global/bin:/Users/lalford/.rvm/rubies/ruby-1.9.3-p362/bin:/Users/lalford/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/lalford/.rvm/bin:$SCALA_HOME/bin
#export PATH="/opt/chef/embedded/bin:$PATH"

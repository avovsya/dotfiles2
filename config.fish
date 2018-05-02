############################################################################################
# ALIASES
############################################################################################
alias tmux="env TERM=xterm-256color tmux -2"

alias l="ls -lAhG"
alias ssh="ssh -A"

alias ps="ps aux"

# Emacs daemon and emacs client
# Run in the terminal. Start daemon if not started yet
alias e='emacsclient -t -a "" $argv'
# Run in the existing GUI frame. Start daemon if not started yet
alias em='emacsclient -a "" $argv >/dev/null 2>&1 &'
# Run new GUI frame. Start daemon if not started yet
alias ema='emacsclient -c -a "" $argv >/dev/null 2>&1 &'

set -x AWS_SECRET_ACCESS_KEY fnVlh8A1jwdF9kNXL8Z0TaKJo2eMuIqBCpn+8D1a

# Python
eval (python -m virtualfish)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# SPARK, HIVE, HADOOP, KERBEROS
set -x PYTHONPATH $PYTHONPATH "/Users/artem.vovsia/bin/spark-2.2.0-bin-hadoop2.7/python" $PYTHONPATH
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
set -x HADOOP_HOME "/Users/artem.vovsia/bin/hive_client/hadoop-2.7.5"
set -x HADOOP_PREFIX "/Users/artem.vovsia/bin/hive_client/hadoop-2.7.5"
set -x HADOOP_CONF_DIR "/Users/artem.vovsia/bin/hive_client/hadoop_conf"
set -x HIVE_CONF_DIR "/Users/artem.vovsia/bin/hive_client/hadoop_conf"
set -x SPARK_HOME "/Users/artem.vovsia/bin/spark-2.2.0-bin-hadoop2.7"
set -x KRB_USERNAME artem.vovsia
set -x KRB_KEYTAB /Users/artem.vovsia/bin/hive_client/krb/artem.vovsia.headless.keytab

set -x PYSPARK_DRIVER_PYTHON "jupyter"
set -x PYSPARK_DRIVER_PYTHON_OPTS "'notebook'"

set -x PATH $PATH "/Users/artem.vovsia/bin/hive_client/apache-hive-1.2.2-bin/bin"
set -x PATH $PATH "/Users/artem.vovsia/bin/hive_client/hadoop-2.7.5/bin"
set -x PATH $PATH "/Users/artem.vovsia/bin/spark-2.2.0-bin-hadoop2.7/bin"
set -x PATH $PATH "/Users/artem.vovsia/.fzf/bin"
set -x PATH $PATH "/Users/artem.vovsia/bin/google-cloud-sdk/bin"

export PATH="/Users/artem.vovsia/src/spark-1.6.3-bin-hadoop2.4/bin:/Users/artem.vovsia/Library/Python/3.6/bin:/Users/artem.vovsia/.fzf/bin:/Users/artem.vovsia/Downloads/google-cloud-sdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/artem.vovsia/src/hive_client/hadoop-2.7.4/bin"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/artem.vovsia/bin/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/artem.vovsia/bin/google-cloud-sdk/path.fish.inc'; else; . '/Users/artem.vovsia/bin/google-cloud-sdk/path.fish.inc'; end; end

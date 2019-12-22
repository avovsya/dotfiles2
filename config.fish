# ALIASES
alias tmux="env TERM=xterm-256color tmux -2"
alias l="ls -lAhG"
alias ssh="ssh -A"
alias ps="ps aux"

alias p="pwd"
alias b="git status -sb"
function v
  if set -q VIRTUAL_ENV
    echo $VIRTUAL_ENV
  end
end

# RUST
set -x PATH $PATH "$HOME/.cargo/bin:$PATH"

# SPARK, HIVE, HADOOP
set -x PATH $PATH "/Users/artemvovsia/Documents/bin/spark-2.3.3-bin-hadoop2.7/bin"

set -x SPARK_HOME "/Users/artemvovsia/Documents/bin/spark-2.3.3-bin-hadoop2.7"

set -x PYTHONPATH $PYTHONPATH "$SPARK_HOME/python"
set -x PYTHONPATH $PYTHONPATH "$SPARK_HOME/python/lib/py4j-0.10.7-src.zip"

# set -x HADOOP_HOME "/Users/artemvovsia/Documents/bin/hadoop-2.7.3"
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home"

# set -x SPARK_HOME "/Users/artemvovsia/bin/spark-2.3.1-bin-hadoop2.7"
# set -x PYTHONPATH $PYTHONPATH "/Users/artem.vovsia/bin/spark-2.3.1-bin-hadoop2.7/python"
# set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
# set -x PATH $PATH "/Users/artemvovsia/bin/spark-2.3.1-bin-hadoop2.7/bin"

# PYTHON
eval (python3 -m virtualfish)
set -x PYSPARK_DRIVER_PYTHON "ipython" # "jupyter"
set -x PYSPARK_SUBMIT_ARGS "--packages com.amazonaws:aws-java-sdk:1.7.4,org.apache.hadoop:hadoop-aws:2.7.7 pyspark-shell"
# set -x PYSPARK_DRIVER_PYTHON_OPTS "'notebook'"

# TOOLS
# The next line updates PATH for the Google Cloud SDK.
# set -x PATH $PATH "/usr/local/opt/python/libexec/bin"
set -x PATH $PATH "/Users/artemvovsia/.fzf/bin"
set -x PATH $PATH "/Users/artemvovsia/Documents/bin/google-cloud-sdk/bin"
# set -x PATH $PATH "/Applications/Postgres.app/Contents/Versions/10/bin"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# PROMPT
# Don't show anything on the right
function fish_right_prompt
#intentionally left blank
end

# SKIMLINKS
source ~/dotfiles/priv_skimlinks.fish

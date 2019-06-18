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

# SPARK, HIVE, HADOOP
set -x PYTHONPATH $PYTHONPATH "/Users/artem.vovsia/bin/spark-2.3.1-bin-hadoop2.7/python"
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
set -x SPARK_HOME "/Users/artem.vovsia/bin/spark-2.3.1-bin-hadoop2.7"
set -x PATH $PATH "/Users/artem.vovsia/bin/spark-2.3.1-bin-hadoop2.7/bin"

# PYTHON
eval (python -m virtualfish)
set -x PYSPARK_DRIVER_PYTHON "ipython" # "jupyter"
set -x PYSPARK_SUBMIT_ARGS "--packages com.amazonaws:aws-java-sdk:1.11.329,org.apache.hadoop:hadoop-aws:2.6.0 pyspark-shell"
set -x PYSPARK_DRIVER_PYTHON_OPTS "'notebook'"

# TOOLS
# The next line updates PATH for the Google Cloud SDK.
set -x PATH $PATH "/Users/artem.vovsia/.fzf/bin"
set -x PATH $PATH "/Users/artem.vovsia/bin/google-cloud-sdk/bin"
set -x PATH $PATH "/Applications/Postgres.app/Contents/Versions/10/bin"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# PROMPT
# Don't show anything on the right
function fish_right_prompt
#intentionally left blank
end

# SKIMLINKS
source ~/dotfiles/priv_skimlinks.fish
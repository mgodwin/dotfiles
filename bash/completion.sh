if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
fi

if [ -f $DEPLOY_DIR/lib/bash_completion ]; then
  source $DEPLOY_DIR/lib/bash_completion
fi

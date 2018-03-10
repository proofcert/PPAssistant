
#!/bin/bash
# Copyright (C) 2015 INRIA

source prover.lib.sh

parse_args "$@"
init
RUNNER_MOD_TARGET="${RUNNER_MOD_TARGET}"
RUNNER_SIG_TARGET="${RUNNER_SIG_TARGET}"
CMD="tjsim -b runner -s run."

if [ -z "$NO_PREPARE" ]; then

  cleanup


  echo -e "module ${MODNAME}.\\n" >> $RUNNER_MOD_TARGET
  echo -e "sig ${MODNAME}.\\n" >> $RUNNER_SIG_TARGET

  if [ $ELEMENTS -lt 1 ]
    then echo "Error: at least one certificate must be given!"
    else
    for (( i=0;i<$ELEMENTS;i++)); do
          echo -e "accum_sig ${ARGS[${i}]}.\\n" >> $RUNNER_SIG_TARGET
          echo -e "accumulate ${ARGS[${i}]}.\\n" >> $RUNNER_MOD_TARGET
    done

    `cat $RUNNER_MOD_BASE >> $RUNNER_MOD_TARGET`
    `cat $RUNNER_SIG_BASE >> $RUNNER_SIG_TARGET`
  fi
fi

if [ -z "$NO_RUN" ]; then
    cd $SRCDIR && \
    source TJPATH && \
    make>/dev/null && \
    $CMD
fi

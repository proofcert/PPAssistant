#!/bin/bash
# Copyright (C) 2018 Tomer Libal

source prover.lib.sh

parse_args "$@"
init
RUNNER_MOD_TARGET="${RUNNER_MOD_TARGET%%.mod}.elpi"

if [ -z "$NO_PREPARE" ]; then

  cleanup

  echo -e "module  ${MODNAME}.\\n" >> $RUNNER_MOD_TARGET
  echo " (${ARGS[0]}) (interact L_ ${ARGS[1]} _ e [])." >> $RUNNER_MOD_TARGET

  `cat $RUNNER_MOD_BASE >> $RUNNER_MOD_TARGET`
  echo 'main :- run.' >> $RUNNER_MOD_TARGET
fi

export CMD="elpi${VARIANT} -test ${MODNAME}.elpi"
echo $CMD
if [ -z "$NO_RUN" ]; then
    cd $SRCDIR && \
    source TJPATH && \
    $CMD
#    rm -f $RUNNER_MOD_TARGET
fi


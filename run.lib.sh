#!/bin/bash
# Copyright (C) 2018 Tomer Libal

function init(){
BASEDIR="`pwd`"
SRCDIR=$BASEDIR/src
TOOLS=$SRCDIR/TOOLS
RUNNER_MOD_BASE=$TOOLS/runner.mod.file
RUNNER_SIG_BASE=$TOOLS/runner.sig.file
MODNAME=${MODNAME:-runner}
RUNNER_MOD_TARGET=$SRCDIR/${MODNAME}.mod
RUNNER_SIG_TARGET=$SRCDIR/${MODNAME}.sig
}

function cleanup(){
rm -f $SRCDIR/kernel/lmf/lmf-kernel.lpo $SRCDIR/kernel/lmf/lmf-kernel.lp $SRCDIR/kernel/lmf/lmf-kernel.mod
cp $TOOLS/kernel_debug/lmf-kernel.mod$DEBUG $SRCDIR/kernel/lmf/lmf-kernel.mod

rm -f $RUNNER_MOD_TARGET
rm -f $RUNNER_SIG_TARGET
}

function parse_args() {
ARGS=()
while [ ! -z "$1" "$2" ]; do
	case $1 in
	--module-name)
		shift
		MODNAME="runner$1"
	;;
	--prepare-only)
		NO_RUN=true
	;;
  --debug)
		DEBUG=".debug"
	;;
	--run-only)
		NO_PREPARE=true
	;;
	*)
		ARGS+="$1"
		ARGS+="$2"
	;;
	esac
	shift
done
ELEMENTS=${#ARGS[@]}
}

#! /usr/bin/env bash

if [ -n "${INSIDE_SXAT_ENV}" ]; then
	echo "Already inside LLVM environment! (INSIDE_SXAT_ENV is set)"
	return;
fi

export ENV_ROOT=${PWD}
declare -a PrefixArray=("${PWD}/build/build" "${PWD}/prefix")

for Prefix in "${PrefixArray[@]}"; do
  echo "Adding prefix ${Prefix}"
  export PATH=${Prefix}/bin:${PATH}
  export CPATH=${Prefix}/include:${CPATH}
  export LD_LIBRARY_PATH=${Prefix}/lib:${LD_LIBRARY_PATH}
  export LIBRARY_PATH=${Prefix}/lib:${LIBRARY_PATH}
done

cfgFile="${ENV_ROOT}/.config.sh"
if [ -f "$cfgFile" ]
then
  echo "Included $cfgFile"
fi

export INSIDE_SXAT_ENV=1

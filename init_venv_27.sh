#!/bin/bash
ROOT=$(pwd)
FILE_NAME=$(basename $0);

if [[ "$(python -V 2>&1)" =~ ^Python\ 2\.7  ]];then
    PYTHON=$(which python)
elif [[ -f $(which python2.7) ]];then
    PYTHON=$(which python2.7)
else
    echo "python2.7 not found"
    exit 1
fi
VENV="venv27"
PIP_FILE=pipreqs.txt

REQ_FILE=${ROOT}/${PIP_FILE}

if [[ ! -f ${REQ_FILE} ]];then
    echo ${PIP_FILE} not found
    exit 1
fi


echo Installing dependencies to venv environment
virtualenv --no-site-packages --python=${PYTHON} ${VENV} && ARCHFLAGS="-arch x86_64" ./${VENV}/bin/pip install -r ${REQ_FILE}

cd $ROOT

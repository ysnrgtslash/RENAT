#!/bin/sh

# $Date: 2018-03-20 02:58:07 +0900 (Tue, 20 Mar 2018) $
# $Rev: 0.1.6 $
# $Ver: 0.1.7 $
# $Author: bachng $
# usage: ./runsh [-n <num>] <other robot argument>

# read renat resource
# the RENAT_PATH variable is evaluated with this priority
# environment variable < suite renat.rc < case renat.rc
if [ -f ../renat.rc ]; then
    source ../renat.rc
fi

if [ -f ./renat.rc ]; then
    source ./renat.rc
fi

if [ -z "$RENAT_PATH" ]; then
  echo "RENAT_PATH environment variable is not defined. Please check your environment"
  exit 1
else
  echo "Current RENAT path: $RENAT_PATH"
fi

export DISPLAY=:1

OPT1=$1
OPT2=$2
shift 2
OPTX=$@

PWD=$(pwd)
PID=$(echo $PWD | md5sum | cut -f1 -d' ')

if [ "$OPT1" == "-n" ]; then
  echo "Run $OPT2 times"
  echo "Parameter=$OPTX"
  for i in $(seq -f "%03g" 1 $OPT2); do
    LOG_FOLDER="result_$i"
    robot $OPTX -d ${LOG_FOLDER} -v RESULT_FOLDER:$LOG_FOLDER main.robot
  done
else 
  echo "Run only once"
  # echo "parameter=$OPT1 $OPT2 $OPTX"
  LOG_FOLDER="result"
  robot $OPT1 $OPT2 $OPTX -d ${LOG_FOLDER} -v PID:$PID -v RESULT_FOLDER:$LOG_FOLDER -v RENAT_PATH:$RENAT_PATH main.robot
fi

sqlite3 /home/robot/run.sqlite3 "UPDATE run_table SET count = count + 1 WHERE name='$USER'"


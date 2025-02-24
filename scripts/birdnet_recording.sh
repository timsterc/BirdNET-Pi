#!/usr/bin/env bash
set -x
source /etc/birdnet/birdnet.conf

if [ "${TIMESTAMP_FORMAT}" == "12" ];then
  STAMP="%I:%M:%S%P"
else
  STAMP="%H:%M:%S"
fi

[ -z $RECORDING_LENGTH ] && RECORDING_LENGTH=15

if pgrep arecord &> /dev/null ;then
  echo "Recording"
else
  if [ -z ${REC_CARD} ];then
    arecord -f S16_LE -c${CHANNELS} -r48000 -t wav --max-file-time ${RECORDING_LENGTH}\
      --use-strftime ${RECS_DIR}/%B-%Y/%d-%A/%F-birdnet-${STAMP}.wav
  else
    arecord -f S16_LE -c${CHANNELS} -r48000 -t wav --max-file-time ${RECORDING_LENGTH}\
     -D "${REC_CARD}" --use-strftime \
     ${RECS_DIR}/%B-%Y/%d-%A/%F-birdnet-${STAMP}.wav
  fi
fi

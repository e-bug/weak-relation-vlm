#!/bin/bash

BASE_DIR="/workdir"
CODE_DIR=${BASE_DIR}/fine-grained-evals/models/BLIP
CKPT_DIR=${BASE_DIR}/checkpoints
OUTS_DIR=${BASE_DIR}/fine-grained-evals/outputs
ENVS_DIR=${BASE_DIR}/envs

name=blip_vitl_129m
task=Flickr
configs=configs_ours/${task}_large.yaml
ckpt=${CKPT_DIR}/BLIP/model_large.pth
output=${OUTS_DIR}/${task}/${name}

mkdir -p $output

source ${ENVS_DIR}/blip/bin/activate

cd $CODE_DIR
python train_retrieval.py \
    --config $configs \
    --checkpoint $ckpt \
    --output_dir $output \
    --evaluate \
    # --device cpu

deactivate 

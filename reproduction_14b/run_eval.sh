#!/bin/bash

EXP_NAME="DeepSWE-Preview-SWE-Bench-Verified-test"
TEMP=1.0

export OPENAI_API_KEY=EMPTY


# Run the DeepSWE agent on SWE-Bench Verified
time python src/r2egym/agenthub/run/edit.py runagent_multiple \
    --traj_dir "./traj" \
    --max_workers 48 \
    --start_idx 0 \
    --k 500 \
    --dataset "R2E-Gym/SWE-Bench-Verified" \
    --split "test" \
    --llm_name "openai/agentica-org/DeepSWE-Preview" \
    --scaffold "r2egym" \
    --use_fn_calling False \
    --exp_name "$EXP_NAME" \
    --temperature "$TEMP" \
    --max_steps_absolute 100 \
    --backend "docker" \
    --condense_history False \
    --max_reward_calc_time 1200 \
    --max_tokens 65536


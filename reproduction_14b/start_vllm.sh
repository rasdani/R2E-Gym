#!/bin/bash

# TP=8
TP=1

# Start VLLM server with tensor parallelism across 8 GPUs
export MAX_CONTEXT_LEN=65536
VLLM_ALLOW_LONG_MAX_MODEL_LEN=1 vllm serve agentica-org/DeepSWE-Preview \
    --tensor-parallel-size $TP \
    --max-model-len $MAX_CONTEXT_LEN \
    --hf-overrides '{"max_position_embeddings": '$MAX_CONTEXT_LEN'}' \
    --enable_prefix_caching \
    --quantization fp8

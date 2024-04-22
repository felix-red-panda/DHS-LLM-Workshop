accelerate launch --config_file "configs/fsdp_config.yaml"  train.py \
--seed 100 \
--model_name_or_path "meta-llama/Meta-Llama-3-70B" \
--dataset_name "oscar-corpus/OSCAR-2301" \
--chat_template_format "none" \
--add_special_tokens False \
--append_concat_token False \
--splits "train,test" \
--max_seq_len 4096 \
--num_train_epochs 1 \
--logging_steps 5 \
--log_level "info" \
--logging_strategy "steps" \
--evaluation_strategy "epoch" \
--save_strategy "epoch" \
--push_to_hub \
--hub_private_repo True \
--hub_strategy "every_save" \
--bf16 True \
--packing True \
--learning_rate 2e-5 \
--lr_scheduler_type "cosine" \
--weight_decay 0.0 \
--warmup_ratio 0.1 \
--max_grad_norm 1.0 \
--output_dir "mistral-sft-fsdp" \
--per_device_train_batch_size 64 \
--per_device_eval_batch_size 64 \
--gradient_accumulation_steps 4 \
--gradient_checkpointing True \
--use_reentrant False \
--dataset_text_field "text" \
--use_flash_attn True

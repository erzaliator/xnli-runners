# if xnli dta_loader throws an error then delete this folder
# rm -r xnli


#**********************train the model and save checkpoint*****************************
python 07_xnli.py \
  --model_name_or_path bert-base-german-cased \
  --language de \
  --train_language de \
  --do_train \
  --do_eval \
  --do_predict \
  --per_gpu_train_batch_size 64 \
  --learning_rate 5e-5 \
  --num_train_epochs 4.0 \
  --max_seq_length 128 \
  --output_dir ./xnli_results/ \
  --save_steps -1 \
  --overwrite_cache \
  --overwrite_output_dir
# --max_train_samples 100 \
# --max_eval_samples 100 \
# --max_predict_samples 100 \

#NOTE: make sure there are no other runs in output_dir

#**********************load checkpoint and run on test split*****************************
python 07_xnli.py \
  --model_name_or_path ./xnli_results \
  --language de \
  --train_language de \
  --do_predict \
  --per_gpu_train_batch_size 64 \
  --learning_rate 5e-5 \
  --num_train_epochs 4.0 \
  --max_seq_length 128 \
  --output_dir ./xnli_results/ \
  --save_steps -1 \
  --overwrite_cache
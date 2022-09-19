#!/bin/bash
#SBATCH -J xzq_test
#SBATCH -p dgx2
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --time=00:30:00
#SBATCH --mail-type=end
#SBATCH --mail-user=your_email@sjtu.edu.cn

# if you want to switch working directory
# cd working_dir/

python -c "import tensorflow as tf; \
           print('Num GPUs Available: ', len(tf.config.experimental.list_physical_devices('GPU')));”

# run python script
# python test_scipt.py

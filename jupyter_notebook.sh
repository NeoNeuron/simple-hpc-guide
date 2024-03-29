#!/bin/bash
#SBATCH --partition you_partation
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 5
#SBATCH --mem-per-cpu 3G
#SBATCH --time 24:00:00
#SBATCH --job-name jupyter_notebook
#SBATCH --output jupyter_notebook_%J.log
#SBATCH --error jupyter_notebook_%J.log
#SBATCH --mail-user=your_email@sjtu.edu.cn

# get tunneling info
# DO NOT CHANGE
XDG_RUNTIME_DIR=""
port=$(shuf -i8000-9999 -n1)
node=$(hostname -s)
user=$(whoami)
cluster=$(hostname -f | awk -F"." '{print $2}')

### 在这里添加你的服务器地址
clusterurl="xxx.xxx.xxx.xxx"

export PATH=$PATH:~/.local/bin

# print tunneling instructions jupyter-log
echo -e "
Copy macOS or linux terminal command below to create your ssh tunnel:

  ssh -N -L ${port}:${node}:${port} ${user}@${clusterurl}
 
 Here is the MobaXterm info:

 Forwarded port:same as remote port
 Remote server: ${node}
 Remote port: ${port}
 SSH server: ${cluster}.${clusterurl}
 SSH login: $user
 SSH port: 22

 Use a Browser on your local machine to go to:
 localhost:${port} (prefix w/ https:// if using password)

 or copy the URL from below and put there localhost after http:// so it would be something like:
 http://localhost:9499/?token=86c93ba16aaead7529a5da0e5e5a46be7ad8cfea35b2d49f
 "

# DON'T USE ADDRESS BELOW. 
# DO USE TOKEN BELOW.
jupyter-notebook --no-browser --port=${port} --ip=${node}

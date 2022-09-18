# check availble modules
    module avail
    # Load module of anaconda and cuda
    module load miniconda3 cuda/10.1
    # check whether module loading is successful
    module list
    # setup auto-module-load in .bashrc
    echo "module load miniconda3 cuda/10.1" >> .bashrc
    # conda initilization
    conda init

    # create a new conda env, named myenv, with python version 3.9, 
    # and install packages for sci-computing
    conda create --name myenv python=3.9 numpy pandas scipy matplotlib jupyter notebook ipykernel -y

    # activate new env
    conda activate myenv
    # add auto activation to .bashrc
    echo "conda activate myenv" >> .bashrc

    # install pytorch
    conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch -y

    # install jupyter kernel (optional)
    python -m ipykernel install --user --name myenv --display-name "Python (myenv)"
    # install sklearn (optional)
    conda install -c conda-forge scikit-learn -y

    # install tensorflow-gpu 2 (Default)
    pip install -y tensorflow-gpu
    # 若想安装tensorflow-gpu 1.15，请勿同时安装两个版本，容易出错。
    pip install -y tensorflow-gpu==1.15
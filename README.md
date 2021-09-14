# **ling-110-docker-image**
## _Computational Linguistics_
***
### **Pip Packages:**
``` Dockerfile
pip install gensim && \
    pip install timeout-decorator && \
    pip install morfessor && \
    pip install cython && \
    pip install arpa && \
    pip install linguistics 
```
***
### **APT Packages:**
``` Dockerfile
apt-get update && apt-get install -y g++ git subversion automake \
libtool zlib1g-dev libicu-dev libboost-all-dev libbz2-dev liblzma-dev \
python-dev graphviz imagemagick make cmake libgoogle-perftools-dev autoconf gawk \
doxygen && rm -rf /var/lib/apt/lists/*
```


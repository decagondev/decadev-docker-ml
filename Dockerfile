FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV PATH="/usr/local/go/bin:${PATH}"
ENV PYTHON_VERSION=3.11

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gdb \
    python3 \
    python3-pip \
    python3-dev \
    nasm \
    make \
    binutils \
    libc6-dev-i386 \
    gcc-multilib \
    g++-multilib \
    git \
    curl \
    qemu-system \
    grub-pc-bin \
    xorriso \
    wget \
    binwalk \
    ltrace \
    strace \
    file \
    hexedit \
    elfutils \
    patchelf \
    netcat \
    net-tools \
    gdb-multiarch \
    cmake \
    clang \
    lld \
    ninja-build \
    pkg-config \
    libssl-dev \
    libffi-dev \
    ripgrep \
    fd-find \
    unzip \
    gettext \
    libpq-dev \
    python3-venv \
    libblas-dev \
    liblapack-dev \
    libhdf5-dev \
    graphviz \
    && apt-get clean \
    && rm -rf /var/lib/ap
    
RUN pip3 install --no-cache-dir \
    keystone-engine \
    unicorn \
    capstone \
    ropper \
    pwntools \
    z3-solver \
    angr \
    r2pipe \
    pefile \
    frida-tools \
    volatility3 \
    neovim

RUN pip3 install --no-cache-dir \
    torch \
    torchvision \
    torchaudio \
    tensorflow \
    jax \
    jaxlib \
    numpy \
    pandas \
    scikit-learn \
    matplotlib \
    seaborn \
    jupyter \
    langchain \
    openai \
    anthropic \
    groq \
    transformers \
    llama-index \
    chromadb \
    faiss-cpu \
    pinecone-client \
    weaviate-client \
    mlflow \
    wandb \
    dvc \
    vllm \
    accelerate \
    datasets \
    evaluate \
    scipy \
    plotly \
    streamlit

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz && \
    rm go1.21.6.linux-amd64.tar.gz

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g pnpm

RUN pnpm add -g \
    @langchain/openai \
    @anthropic-ai/sdk \
    @huggingface/inference \
    @tensorflow/tfjs-node \
    typescript \
    ts-node \
    @types/node

RUN git clone https://github.com/neovim/neovim.git /opt/neovim && \
    cd /opt/neovim && \
    git checkout stable && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make install && \
    cd / && \
    rm -rf /opt/neovim

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim && \
    rm -rf ~/.config/nvim/.git

RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

RUN git clone https://github.com/pwndbg/pwndbg /opt/pwndbg && \
    cd /opt/pwndbg && \
    ./setup.sh

RUN git clone https://github.com/radareorg/radare2.git /opt/radare2 && \
    cd /opt/radare2 && \
    sys/install.sh && \
    rm -rf /opt/radare2

RUN git clone https://github.com/ReFirmLabs/binwalk.git /opt/binwalk && \
    cd /opt/binwalk && \
    python3 setup.py install

RUN git clone https://github.com/JonathanSalwan/ROPgadget.git /opt/ROPgadget && \
    cd /opt/ROPgadget && \
    python3 setup.py install

WORKDIR /workdir

RUN echo 'PS1="\\u@docker:\\w$ "' >> /root/.bashrc && \
    echo 'source /root/.gdbinit-gef.py' >> /root/.bashrc && \
    echo 'export PATH=$PATH:/root/.cargo/bin:/usr/local/go/bin' >> /root/.bashrc && \
    echo 'alias vim="nvim"' >> /root/.bashrc && \
    echo 'alias vi="nvim"' >> /root/.bashrc && \
    echo 'alias python="python3"' >> /root/.bashrc && \
    echo 'alias pip="pip3"' >> /root/.bashrc

RUN mkdir -p /opt/ai-templates && \
    mkdir -p /opt/ai-templates/python && \
    mkdir -p /opt/ai-templates/javascript

ENTRYPOINT ["/bin/bash"]

# Optional: Add CUDA support (uncomment if needed)
# ENV CUDA_VERSION=11.8
# RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb && \
#     dpkg -i cuda-keyring_1.0-1_all.deb && \
#     apt-get update && \
#     apt-get install -y cuda-toolkit-11-8 && \
#     rm cuda-keyring_1.0-1_all.deb

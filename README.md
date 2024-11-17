# 🛠️ Advanced Development, AI Engineering & Reverse Engineering Environment

> 🔬 A professional-grade Docker environment for AI/ML development, systems programming, reverse engineering, binary analysis, and secure development.

[![Docker Required](https://img.shields.io/badge/Docker-Required-blue?logo=docker)](https://docs.docker.com/get-docker/)
[![NeoVim](https://img.shields.io/badge/NeoVim-LazyVim-green?logo=neovim)](https://www.lazyvim.org/)
[![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)](https://www.python.org/)
[![Node.js](https://img.shields.io/badge/Node.js-20.x-green?logo=node.js)](https://nodejs.org/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

## 📋 Overview

This project provides a comprehensive, containerized development environment specifically designed for:
- 🤖 AI/ML Development & Research
- 🔥 LLM Integration & Fine-tuning
- 🎯 Production AI System Development
- 🔒 Security Research & Reverse Engineering
- 💻 Systems Programming & Low-level Development
- 🐞 Binary Analysis & Debugging
- 🔧 Cross-architecture Development
- 🖥️ Operating System Development

---

## ✨ Features & Tools

### 🤖 AI Development Stack

#### 🐍 Python AI/ML Tools
- **Core ML Frameworks**
  - PyTorch with CUDA support
  - TensorFlow 2.x
  - JAX/Jaxlib
  - NumPy/Pandas
  - Scikit-learn
  - SciPy
  
- **LLM Frameworks & Tools**
  - LangChain
  - OpenAI SDK
  - Anthropic SDK
  - Groq SDK
  - Hugging Face Transformers
  - LlamaIndex
  - vLLM
  - Accelerate
  - Datasets
  - Evaluate

- **Vector Databases**
  - ChromaDB
  - FAISS
  - Pinecone SDK
  - Weaviate Client
  
- **Model Management & Monitoring**
  - MLflow
  - Weights & Biases
  - DVC (Data Version Control)
  
- **Visualization & Analysis**
  - Matplotlib
  - Seaborn
  - Plotly
  - Jupyter Notebooks
  - Streamlit

#### 🟨 JavaScript/TypeScript AI Tools
- **Core Frameworks**
  - TensorFlow.js
  - LangChain.js
  - OpenAI Node.js SDK
  - Anthropic SDK
  - Hugging Face Inference
  
- **Development Tools**
  - Node.js 20.x LTS
  - pnpm Package Manager
  - TypeScript
  - ts-node

### 🎯 Core Development Environment

#### 📝 NeoVim + LazyVim
- Modern, blazingly fast text editor
- Full LSP (Language Server Protocol) support
- Integrated terminal
- Git integration
- Fuzzy finding
- File tree explorer
- Auto-completion
- Syntax highlighting
- Custom keybindings
- Extensible plugin system

#### 🛠️ Compilers & Languages
- **GCC/G++**
  - 32-bit & 64-bit support
  - Multi-lib capabilities
- **Clang/LLVM**
  - Alternative compiler toolchain
  - Static analysis tools
- **Rust**
  - Latest stable toolchain
  - Systems programming
  - Cross-compilation support
- **Go 1.21.6**
  - Modern systems programming
  - Network tool development
- **NASM**
  - x86/x64 assembly development
  - Bootloader development

### 🔍 Reverse Engineering Tools

#### Analysis Frameworks
- **Radare2**
  - Binary analysis
  - Disassembly
  - Debugging capabilities
  - Scripting support
- **GDB Enhanced Features (GEF)**
  - Advanced debugging
  - Exploit development
  - Memory analysis
- **PwnDBG**
  - Alternative GDB enhancement
  - Exploit development features

#### Binary Analysis Tools
- **Binwalk**
  - Firmware analysis
  - File system extraction
- **ROPgadget**
  - ROP chain discovery
  - Exploit development
- **Frida**
  - Dynamic instrumentation
  - Runtime analysis
- **Other Tools**
  - pefile
  - Keystone Engine
  - Unicorn Engine
  - Capstone
  - Ropper

#### Python Security Tools
- **Pwntools**
  - Exploit development
  - CTF toolkit
- **Angr**
  - Binary analysis
  - Symbolic execution
- **Volatility3**
  - Memory forensics
  - Process analysis

### 💻 Low-Level Development

#### System Tools
- **QEMU**
  - System emulation
  - Architecture simulation
- **GRUB**
  - Bootloader development
  - OS development
- **xorriso**
  - ISO creation
  - Boot image manipulation

#### Debugging & Tracing
- **ltrace**
  - Library call tracing
- **strace**
  - System call tracing
- **gdb-multiarch**
  - Cross-architecture debugging

---

## 🚀 Getting Started

### Prerequisites
- Docker Desktop installed
- Git (optional)
- 8GB+ RAM recommended (16GB+ for AI workloads)
- 20GB+ free disk space
- NVIDIA GPU + CUDA drivers (optional, for GPU acceleration)

### 🐳 Quick Start

0. **fork the Repository**
- fork it to your account

1. **Clone the Repository**
```bash
git clone https://github.com/yourusername/decadev-docker-ml.git
cd decadev-docker-ml
```

2. **Build the Container**
```bash
# CPU-only build
docker build -t decadev-docker-ml .

# GPU-enabled build (uncomment CUDA section in Dockerfile first)
docker build -t decadev-docker-ml --build-arg USE_GPU=true .
```

3. **Run the Environment**
```bash
# CPU-only
docker run -it -v $(pwd):/workdir decadev-docker-ml

# With GPU support
docker run -it --gpus all -v $(pwd):/workdir decadev-docker-ml
```

4. **Verify Installation**
```bash
# Check NeoVim
nvim --version

# Check Python AI tools
python -c "import torch; print(f'PyTorch: {torch.__version__}')"
python -c "import tensorflow as tf; print(f'TensorFlow: {tf.__version__}')"
python -c "import langchain; print(f'LangChain: {langchain.__version__}')"

# Check Node.js tools
node --version
pnpm list @langchain/openai
```

---

## 💡 Development Guides

### 🤖 AI/ML Development

#### LLM Integration Example
```python
from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain

# Initialize LLM
llm = OpenAI(temperature=0.7)

# Create prompt template
prompt = PromptTemplate(
    input_variables=["topic"],
    template="Write a brief analysis about {topic}."
)

# Create chain
chain = LLMChain(llm=llm, prompt=prompt)

# Run chain
result = chain.run(topic="artificial intelligence")
```

#### Vector Database Usage
```python
import chromadb

# Initialize client
client = chromadb.Client()

# Create collection
collection = client.create_collection("my_documents")

# Add documents
collection.add(
    documents=["Document 1 content", "Document 2 content"],
    metadatas=[{"source": "web"}, {"source": "book"}],
    ids=["doc1", "doc2"]
)

# Query
results = collection.query(
    query_texts=["search query"],
    n_results=2
)
```

### 🔧 Reverse Engineering Workflows

#### Basic Binary Analysis
```bash
# Using Radare2
r2 -A ./binary
aaa        # Analyze all
afl        # List functions
s main     # Seek to main
pdf        # Print disassembly

# Using GDB/GEF
gdb ./binary
gef> checksec
gef> vmmap
gef> heap
```

#### Assembly Development
```bash
# Compile assembly
nasm -f elf64 code.asm -o code.o
ld code.o -o program

# Debug
gdb ./program
```

---

## 🗂️ Project Structure

```
/
├── Dockerfile          # Container definition
├── README.md          # This file
├── config/            # Tool configurations
│   ├── nvim/          # NeoVim/LazyVim config
│   ├── gdb/           # GDB/GEF config
│   ├── ml/            # ML tools config
│   └── node/          # Node.js config
├── scripts/           # Utility scripts
├── templates/         # Project templates
│   ├── ai/            # AI project templates
│   ├── re/            # RE project templates
│   └── systems/       # Systems project templates
└── workdir/           # Mounted work directory
```

## 🔧 Environment Configuration

### API Keys Setup
```bash
# Create environment file
cat > .env << EOL
OPENAI_API_KEY=your-key
ANTHROPIC_API_KEY=your-key
GROQ_API_KEY=your-key
HUGGINGFACE_TOKEN=your-token
PINECONE_API_KEY=your-key
WANDB_API_KEY=your-key
EOL

# Source environment
source .env
```

### GPU Configuration
```bash
# Check GPU availability
python -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}')"

# Set visible devices
export CUDA_VISIBLE_DEVICES=0
```

## 🐛 Troubleshooting

### Common Issues

1. **Docker Permission Issues**
```bash
sudo usermod -aG docker $USER
newgrp docker
```

2. **CUDA/GPU Issues**
```bash
# Check NVIDIA driver installation
nvidia-smi

# Verify CUDA installation
nvcc --version
```

3. **Python Package Issues**
```bash
# Upgrade pip
pip install --upgrade pip

# Install packages in user space
pip install --user package_name
```

## 📚 Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [LangChain Documentation](https://python.langchain.com/docs)
- [Radare2 Book](https://book.rada.re/)
- [GEF Documentation](https://gef.readthedocs.io/)
- [Docker Documentation](https://docs.docker.com/)
- [PyTorch Documentation](https://pytorch.org/docs)
- [TensorFlow Documentation](https://www.tensorflow.org/docs)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Community

- 🌟 Star this repository if you find it helpful!
- 🐛 Report issues in the issue tracker
- 💡 Submit feature requests
- 🤝 Fork and contribute

---

📝 **Created and maintained by Tom Tarpey**  
🔄 Last updated: November 2024

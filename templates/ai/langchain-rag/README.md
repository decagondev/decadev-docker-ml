# Langchain RAG System

This is a modular implementation of a Retrieval-Augmented Generation (RAG) system using Langchain.

## Features
- Support for multiple document types (.txt, .pdf, .csv)
- Modular architecture with separate document loading and vector store management
- Configurable embedding models
- Optional persistence for vector stores
- Similarity search capabilities

## Usage

```python
from rag_system import RAGSystem

# Initialize the system
rag = RAGSystem()

# Load documents
rag.load_documents("path/to/documents")

# Query the system
response = rag.query("What is the capital of France?")
print(response)
```

## Dependencies
See requirements.txt for full list of dependencies.

## Setup
1. Install dependencies: `pip install -r requirements.txt`
2. Set up OpenAI API key in environment variables
3. Initialize and use the RAG system as shown in usage example
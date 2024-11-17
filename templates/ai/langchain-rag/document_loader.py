from typing import List
from pathlib import Path
from langchain.document_loaders import (
    DirectoryLoader,
    TextLoader,
    PDFLoader,
    CSVLoader
)
from langchain.schema import Document

def load_documents(docs_path: str) -> List[Document]:
    """
    Load documents from various file formats in the specified directory.
    Supports .txt, .pdf, and .csv files.
    """
    path = Path(docs_path)
    
    loaders = {
        ".txt": DirectoryLoader(docs_path, glob="**/*.txt", loader_cls=TextLoader),
        ".pdf": DirectoryLoader(docs_path, glob="**/*.pdf", loader_cls=PDFLoader),
        ".csv": DirectoryLoader(docs_path, glob="**/*.csv", loader_cls=CSVLoader)
    }
    
    documents = []
    for file_type, loader in loaders.items():
        try:
            docs = loader.load()
            documents.extend(docs)
        except Exception as e:
            print(f"Error loading {file_type} files: {str(e)}")
    
    return documents
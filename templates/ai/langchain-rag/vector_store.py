from typing import List, Optional
from langchain.vectorstores import Chroma
from langchain.embeddings.base import Embeddings
from langchain.schema import Document

class VectorStore:
    def __init__(self, embedding_model: Embeddings, persist_directory: Optional[str] = None):
        """
        Initialize the vector store with specified embedding model and optional persistence directory.
        """
        self.embedding_model = embedding_model
        self.persist_directory = persist_directory
        self.vector_store = None

    def create_or_load(self, documents: Optional[List[Document]] = None) -> Chroma:
        """
        Create a new vector store or load an existing one if persist_directory is specified.
        """
        if self.persist_directory and not documents:
            self.vector_store = Chroma(
                persist_directory=self.persist_directory,
                embedding_function=self.embedding_model
            )
        elif documents:
            self.vector_store = Chroma.from_documents(
                documents=documents,
                embedding=self.embedding_model,
                persist_directory=self.persist_directory
            )
        else:
            raise ValueError("Either documents or persist_directory must be provided")
        
        return self.vector_store

    def add_documents(self, documents: List[Document]) -> None:
        """
        Add new documents to the existing vector store.
        """
        if not self.vector_store:
            raise ValueError("Vector store must be initialized first")
        
        self.vector_store.add_documents(documents)
        if self.persist_directory:
            self.vector_store.persist()

    def similarity_search(self, query: str, k: int = 4) -> List[Document]:
        """
        Perform similarity search for a query string.
        """
        if not self.vector_store:
            raise ValueError("Vector store must be initialized first")
        
        return self.vector_store.similarity_search(query, k=k)
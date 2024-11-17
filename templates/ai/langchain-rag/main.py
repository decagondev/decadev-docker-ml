from typing import List
from langchain.embeddings import OpenAIEmbeddings
from langchain.vectorstores import Chroma
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.llms import OpenAI
from langchain.chains import RetrievalQA
from document_loader import load_documents
from vector_store import VectorStore

class RAGSystem:
    def __init__(self, embedding_model="text-embedding-3-large"):
        self.embeddings = OpenAIEmbeddings(model=embedding_model)
        self.vector_store = None
        self.qa_chain = None
        
    def load_documents(self, docs_path: str) -> None:
        documents = load_documents(docs_path)
        text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=1000,
            chunk_overlap=200
        )
        texts = text_splitter.split_documents(documents)
        
        self.vector_store = Chroma.from_documents(
            documents=texts,
            embedding=self.embeddings
        )
        
        self.qa_chain = RetrievalQA.from_chain_type(
            llm=OpenAI(),
            chain_type="stuff",
            retriever=self.vector_store.as_retriever()
        )
        
    def query(self, question: str) -> str:
        if not self.qa_chain:
            raise ValueError("Documents must be loaded first")
        return self.qa_chain.run(question)
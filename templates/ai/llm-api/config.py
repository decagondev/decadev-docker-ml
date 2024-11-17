from pydantic import BaseSettings

class Config(BaseSettings):
    openai_api_key: str
    anthropic_api_key: str
    model_name: str = "gpt-4o-mini"
    max_tokens: int = 1000
    temperature: float = 0.7
    
    class Config:
        env_file = ".env"

from typing import List, Dict, Optional
import os
from openai import OpenAI
from anthropic import Anthropic
import logging
from config import Config

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class LLMService:
    def __init__(self, config: Config):
        self.config = config
        self.openai_client = OpenAI(api_key=config.openai_api_key)
        self.anthropic_client = Anthropic(api_key=config.anthropic_api_key)
        
    async def get_completion(
        self,
        prompt: str,
        provider: str = "openai",
        max_tokens: int = 1000,
        temperature: float = 0.7
    ) -> str:
        try:
            if provider == "openai":
                response = await self.openai_client.chat.completions.create(
                    model="gpt-4-turbo-preview",
                    messages=[{"role": "user", "content": prompt}],
                    max_tokens=max_tokens,
                    temperature=temperature
                )
                return response.choices[0].message.content
                
            elif provider == "anthropic":
                response = await self.anthropic_client.messages.create(
                    model="claude-3-opus-20240229",
                    max_tokens=max_tokens,
                    temperature=temperature,
                    messages=[{"role": "user", "content": prompt}]
                )
                return response.content[0].text
                
            else:
                raise ValueError(f"Unsupported provider: {provider}")
                
        except Exception as e:
            logger.error(f"Error getting completion: {str(e)}")
            raise

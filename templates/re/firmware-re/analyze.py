import binwalk
import logging
from pathlib import Path
from typing import List, Dict

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class FirmwareAnalyzer:
    def __init__(self, firmware_path: str):
        self.firmware_path = Path(firmware_path)
        self.extract_path = self.firmware_path.parent / 'extracted'
        
    def scan_firmware(self) -> List[Dict]:
        """Scan firmware for known signatures."""
        results = []
        for module in binwalk.scan(str(self.firmware_path), signature=True):
            for result in module.results:
                results.append({
                    'description': result.description,
                    'offset': result.offset,
                    'size': result.size
                })
        return results
        
    def extract_filesystem(self) -> Path:
        """Extract filesystem from firmware."""
        logger.info(f"Extracting filesystem from {self.firmware_path}")
        binwalk.extract(
            str(self.firmware_path),
            directory=str(self.extract_path)
        )
        return self.extract_path
        
    def analyze_extracted(self) -> Dict:
        """Analyze extracted contents."""
        if not self.extract_path.exists():
            raise ValueError("Firmware must be extracted first")
            
        analysis = {
            'files': list(self.extract_path.rglob('*')),
            'interesting_files': [],
            'potential_secrets': []
        }
        
        # Look for interesting files
        patterns = ['*.conf', '*.key', 'passwd', 'shadow']
        for pattern in patterns:
            analysis['interesting_files'].extend(
                self.extract_path.rglob(pattern)
            )
            
        return analysis
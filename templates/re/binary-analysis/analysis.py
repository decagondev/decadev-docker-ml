import r2pipe
import angr
import logging
from typing import List, Dict

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class BinaryAnalyzer:
    def __init__(self, binary_path: str):
        self.binary_path = binary_path
        self.r2 = r2pipe.open(binary_path)
        self.r2.cmd('aaa')  # Analyze all
        
    def get_functions(self) -> List[Dict]:
        """Get list of functions in the binary."""
        functions = self.r2.cmdj('aflj')
        return functions if functions else []
        
    def analyze_function(self, func_name: str) -> Dict:
        """Analyze specific function."""
        self.r2.cmd(f's {func_name}')
        return {
            'disasm': self.r2.cmd('pdf'),
            'callgraph': self.r2.cmd('agc'),
            'references': self.r2.cmdj('axtj')
        }
        
    def find_vulnerabilities(self) -> List[Dict]:
        """Basic vulnerability scanning."""
        vulns = []
        
        # Look for common vulnerable functions
        dangerous_funcs = ['strcpy', 'gets', 'sprintf']
        for func in dangerous_funcs:
            refs = self.r2.cmdj(f'axtj {func}')
            if refs:
                vulns.append({
                    'type': 'dangerous_function',
                    'function': func,
                    'references': refs
                })
                
        return vulns

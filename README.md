# GenZ MCP Server: Streamlined AI Development Assistant

<div align="center">
  <b>🤖 <a href="https://www.anthropic.com/claude-code">Claude Code</a> + [Gemini / OpenAI / Grok / OpenRouter / DIAL / Ollama / Any Model] = Focused AI Development Tools</b>
</div>

<br/>

A streamlined Model Context Protocol (MCP) server providing essential AI-powered development tools for your favorite coding agent. GenZ MCP Server focuses on the core functionality you need most: intelligent chat and comprehensive debugging assistance.

## What is GenZ MCP Server?

GenZ MCP Server is a slimmed-down version of the comprehensive Zen MCP Server, containing only the two most essential tools:

- **GenZ Chat** (`genz_chat`) - Interactive development chat and collaborative thinking
- **GenZ Debug** (`genz_debug`) - Systematic root cause analysis and debugging assistance

This focused approach provides:
- ✅ Faster startup and reduced complexity
- ✅ Essential AI-powered development assistance
- ✅ Full multi-model provider support
- ✅ Conversation threading and context preservation
- ✅ Clean, maintainable codebase

## Attribution

GenZ MCP Server is a derivative work of the excellent [Zen MCP Server](https://github.com/BeehiveInnovations/zen-mcp-server) by BeehiveInnovations, with much love and gratitude for their original concepts and innovative ideas. The foundational architecture, multi-provider support, and conversation threading were all pioneered in the original Zen MCP Server.

This fork was created to explore a more focused approach, removing tools that weren't being used in my personal workflow and concentrating on the essential chat and debugging functionality. The original Zen MCP Server remains the comprehensive solution for teams needing the full suite of AI-powered development tools.

## Tools Overview

### 1. GenZ Chat (`genz_chat`)
**Interactive development chat and collaborative thinking**

Perfect for:
- Bouncing ideas during analysis
- Getting second opinions on technical decisions
- Collaborative brainstorming sessions
- Validating approaches and checklists
- General development questions and explanations
- Exploring alternatives and solutions

Features:
- File context support for code discussions
- Image support for UI/visual discussions
- Conversation continuation across sessions
- Web search integration for current information
- Multiple AI model support for diverse perspectives

### 2. GenZ Debug (`genz_debug`)  
**Systematic root cause analysis and debugging assistance**

Perfect for:
- Complex bug investigation
- Mysterious errors and failures
- Performance issues analysis  
- Race conditions and timing problems
- Memory leaks and resource issues
- Integration and configuration problems

Features:
- Step-by-step investigation workflow
- Evidence-based hypothesis tracking
- Confidence levels (exploring → certain)
- Systematic file examination
- Context-aware analysis
- Expert model validation
- Backtracking support for complex investigations

## Quick Start

### Prerequisites
- Python 3.9+
- An API key for at least one supported provider:
  - Gemini API key (`GEMINI_API_KEY`)
  - OpenAI API key (`OPENAI_API_KEY`)
  - OpenRouter API key (`OPENROUTER_API_KEY`)
  - Local Ollama setup (`CUSTOM_API_URL`)
  - Or other supported providers

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo/genz-mcp-server
   cd genz-mcp-server
   ```

2. **Set up your environment:**
   ```bash
   # Create and activate virtual environment
   python -m venv .genz_venv
   source .genz_venv/bin/activate  # On Windows: .genz_venv\Scripts\activate
   
   # Install dependencies
   pip install -r requirements.txt
   ```

3. **Configure API keys:**
   ```bash
   # Copy example and edit
   cp .env.example .env
   # Edit .env with your API keys
   ```

4. **Add to Claude Desktop config:**
   ```json
   {
     "mcpServers": {
       "genz-mcp-server": {
         "command": "python",
         "args": ["/path/to/genz-mcp-server/server.py"],
         "env": {
           "GEMINI_API_KEY": "your_key_here",
           "OPENAI_API_KEY": "your_key_here"
         }
       }
     }
   }
   ```

## Usage Examples

### GenZ Chat Examples

**Basic Development Discussion:**
```
Use genz_chat to discuss the best approach for implementing user authentication 
in a Flask application. Include security considerations and modern best practices.
```

**Code Review Discussion:**
```
Use genz_chat with files: /path/to/auth.py /path/to/models.py
I want to discuss potential security vulnerabilities in this authentication system
and get suggestions for improvements.
```

### GenZ Debug Examples

**Systematic Bug Investigation:**
```
Use genz_debug to investigate why user sessions are randomly expiring in production.
The issue seems intermittent and affects about 5% of users.

Step 1: Describe the issue and form initial investigation plan
Step 2: Examine session handling code and configuration  
Step 3: Investigate potential race conditions or timing issues
```

**Performance Issue Analysis:**
```
Use genz_debug to analyze slow database queries in the user dashboard.
Load times have increased from 200ms to 3+ seconds over the past week.
```

## Model Support

GenZ MCP Server supports all the same AI providers as the full Zen MCP Server:

- **Gemini** (Google AI)
- **OpenAI** (GPT models)  
- **Grok** (X.AI)
- **OpenRouter** (Multiple models)
- **DIAL** (Enterprise)
- **Custom APIs** (Ollama, vLLM, etc.)

### Model Selection
- Set `DEFAULT_MODEL=auto` for automatic model selection
- Or specify models explicitly: `DEFAULT_MODEL=gemini-2.0-flash-exp`
- Override per-request: `model: gpt-4o-mini` in tool calls

## Development

### Running Tests
```bash
# Unit tests
python -m pytest tests/ -v

# Integration tests (requires API keys)  
python -m pytest tests/ -v -m integration

# Code quality checks
./code_quality_checks.sh
```

### Project Structure
```
genz-mcp-server/
├── server.py              # Main MCP server
├── config.py              # Configuration settings
├── tools/
│   ├── genz_chat.py       # Chat tool implementation
│   └── genz_debug.py      # Debug tool implementation  
├── systemprompts/         # AI prompts for tools
├── providers/             # AI model providers
├── utils/                 # Utility modules
└── tests/                 # Test suite
```

## Migration from Zen MCP Server

If you're coming from the full Zen MCP Server, GenZ provides the essential tools you use most:

**Removed tools:** analyze, codereview, consensus, planner, refactor, testgen, thinkdeep, tracer, precommit, secaudit, docgen, challenge, listmodels, version

**Kept tools:** chat → genz_chat, debug → genz_debug

Your existing workflows using chat and debug will continue to work with the new tool names.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes with tests
4. Run quality checks: `./code_quality_checks.sh`
5. Submit a pull request

## License

MIT License - see LICENSE file for details.

## Support

For issues, questions, or feature requests:
- Create an issue in the repository
- Check existing documentation
- Review the original Zen MCP Server docs for advanced concepts

---

GenZ MCP Server: Essential AI tools, maximum focus. 🚀
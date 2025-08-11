# Tech Context: Stylus

## Technology Stack

### Core Language & Framework
- **Python 3.12**: Latest stable Python with enhanced type hints and performance
- **Pydantic v2**: Data validation and serialization with type safety
- **FastAPI**: High-performance API framework for web interfaces
- **NetworkX**: Graph-based story arc and panel relationship modeling

### AI & Machine Learning
- **OpenAI GPT-4**: Text generation for story arcs and dialogue
- **Stable Diffusion**: Image generation for character art and backgrounds
- **Custom Style Transfer Networks**: Maintaining visual consistency
- **Hugging Face Transformers**: Additional NLP capabilities

### Development Environment

#### Package Management
- **Poetry**: Dependency management and virtual environment handling
- **Python 3.12 venv**: Fallback virtual environment for development
- **PyPI Publishing**: Distribution via Python Package Index

#### Code Quality Tools
- **Black**: Deterministic code formatting (line length: 88 chars)
- **Ruff**: Fast Python linter replacing flake8, isort, and others
- **mypy**: Static type checking with strict mode
- **pre-commit**: Git hooks for automated quality checks

#### Testing Framework
- **pytest**: Primary testing framework
- **pytest-asyncio**: Async testing support
- **pytest-cov**: Code coverage reporting
- **hypothesis**: Property-based testing for edge cases

### Documentation Stack

#### Auto-Documentation
- **MkDocs**: Lightweight, Markdown-first documentation
- **Material for MkDocs**: Modern, responsive theme
- **mkdocstrings-python**: Auto-import docstrings from source code
- **mkdocs-mermaid2**: Diagram generation for workflows

#### Interactive Documentation
- **Jupyter-Book**: Render `.ipynb` demo notebooks
- **nbstripout**: Clean notebook outputs from git commits
- **Live Reload**: `mkdocs serve` for real-time doc updates

### CI/CD Pipeline

#### GitHub Actions Workflows
```yaml
# .github/workflows/ci.yml
- Code quality checks (black, ruff, mypy)
- Test suite execution across Python versions
- Coverage reporting and badge updates

# .github/workflows/docs-build.yml
- Documentation build with `mkdocs build --strict`
- Deploy to GitHub Pages via peaceiris/actions-gh-pages
- Preview deployments for pull requests
```

#### Containerization
- **Docker**: Reproducible development and deployment environments
- **Multi-stage builds**: Optimized production images
- **GPU support**: CUDA-enabled containers for art generation

### External Services & APIs

#### AI Model APIs
- **OpenAI API**: GPT-4 for text generation (rate limits: 10k tokens/min)
- **Stability AI**: Stable Diffusion API for image generation
- **Hugging Face Inference**: Fallback models and specialized tasks

#### Infrastructure
- **GitHub Pages**: Documentation hosting
- **Vercel**: Preview deployments for documentation
- **Docker Hub**: Container image registry

## Development Setup

### Environment Configuration
```bash
# Primary setup with Poetry
poetry install --with dev,docs,test
poetry shell

# Alternative with venv
python -m venv stylus-env
source stylus-env/bin/activate  # Linux/Mac
pip install -e ".[dev,docs,test]"
```

### Makefile Commands
```makefile
install:    # Poetry environment setup
format:     # Black + Ruff formatting
lint:       # Ruff linting checks
typecheck:  # mypy static analysis
test:       # pytest with coverage
docs:       # MkDocs build and serve
clean:      # Remove build artifacts
```

### Pre-commit Configuration
```yaml
repos:
  - repo: https://github.com/psf/black
    hooks: [black]
  - repo: https://github.com/charliermarsh/ruff-pre-commit
    hooks: [ruff, ruff-format]
  - repo: https://github.com/pre-commit/mirrors-mypy
    hooks: [mypy]
```

## Technical Constraints

### Performance Requirements
- **Generation Speed**: 4-6 page comic in under 10 minutes
- **Memory Usage**: Laptop-class hardware (8GB RAM minimum)
- **GPU Acceleration**: Optional but recommended for art generation
- **API Rate Limits**: Batch and cache external service calls

### Code Quality Standards
- **Line Coverage**: Minimum 85% test coverage
- **Type Coverage**: 100% type hints on public APIs
- **Code Complexity**: Maximum cyclomatic complexity of 10
- **Line Length**: 88 characters (Black standard)

### Scalability Constraints
- **Codebase Size**: Target under 3,000 lines of code
- **Module Size**: Maximum 200 lines per module
- **Function Size**: Maximum 40 lines per function
- **Class Size**: Maximum 15 methods per class

## Security Considerations

### API Key Management
- Environment variables for sensitive credentials
- `.env` files excluded from version control
- Secrets management in CI/CD pipelines

### Input Validation
- Pydantic schemas for all external inputs
- Sanitization of user-provided content
- Rate limiting on API endpoints

### Dependency Security
- Regular dependency updates via Dependabot
- Security scanning with `safety` and `bandit`
- Pinned versions in production deployments

## Deployment Architecture

### Local Development
- Hot reload with FastAPI development server
- Local model inference for faster iteration
- Docker Compose for full stack testing

### Production Deployment
- Containerized deployment with Docker
- Horizontal scaling for API endpoints
- GPU-enabled instances for art generation
- CDN for static asset delivery

### Monitoring & Observability
- Structured logging with Python `logging`
- Performance metrics collection
- Error tracking and alerting
- User analytics for feature usage

## Version Management

### Semantic Versioning
- **MAJOR**: Breaking API changes
- **MINOR**: New features, backward compatible
- **PATCH**: Bug fixes and improvements

### Release Process
- Conventional Commits for automated changelog
- GitHub Releases with automated asset building
- PyPI publishing via GitHub Actions
- Docker image tagging aligned with releases

This technical foundation supports rapid development while maintaining production-ready quality standards and scalability for the growing user base.

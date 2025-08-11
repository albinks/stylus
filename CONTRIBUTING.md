# Contributing to Stylus

Thank you for your interest in contributing to Stylus! This document provides guidelines and information for contributors.

## 🎯 Project Vision

Stylus aims to democratize comic creation through AI-driven automation while maintaining:
- **Quality**: Professional-looking output regardless of creator skill
- **Simplicity**: Approachable codebase under 3k LOC
- **Extensibility**: Modular architecture for easy enhancement
- **Community**: Welcoming environment for all skill levels

## 🚀 Getting Started

### Prerequisites

- **Python 3.12+** - Latest stable Python
- **Poetry** - For dependency management
- **Git** - For version control
- **Basic AI/ML knowledge** - Helpful but not required

### Development Setup

1. **Fork and clone the repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/stylus.git
   cd stylus
   ```

2. **Set up development environment:**
   ```bash
   make install
   ```

3. **Verify setup:**
   ```bash
   make dev
   ```

4. **Create environment file:**
   ```bash
   cp .env.example .env
   # Edit .env with your API keys
   ```

## 🏗️ Architecture Overview

Stylus follows a **multi-agent pipeline pattern**:

```
Input → Character Agent → Story Agent → Layout Agent → Art Agent → Color Agent → Composer → Output
```

### Key Components

- **Agents** (`stylus/agents/`) - Specialized AI components
- **Schemas** (`stylus/schemas/`) - Pydantic data models
- **Core** (`stylus/core/`) - Shared utilities and context management
- **Tests** (`tests/`) - Comprehensive test suite

### Design Principles

1. **Single Responsibility** - Each agent handles one aspect
2. **Type Safety** - Full Pydantic validation
3. **Context Preservation** - Maintain consistency across agents
4. **Error Handling** - Graceful degradation and recovery

## 🛠️ Development Workflow

### Code Style

We follow strict code quality standards:

```bash
# Format code
make format

# Check linting
make lint

# Type checking
make typecheck

# Run all checks
make dev
```

### Code Standards

- **Line Length**: 88 characters (Black standard)
- **Type Hints**: Required on all public APIs
- **Docstrings**: Google-style for all public functions
- **Test Coverage**: Minimum 85% coverage

### Commit Guidelines

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add character consistency validation
fix: resolve panel layout overflow issue
docs: update API documentation
test: add integration tests for story agent
refactor: simplify context management
```

### Branch Naming

- `feature/description` - New features
- `fix/description` - Bug fixes
- `docs/description` - Documentation updates
- `refactor/description` - Code refactoring

## 🧪 Testing

### Test Structure

```
tests/
├── unit/           # Unit tests for individual components
├── integration/    # Integration tests for agent pipelines
├── fixtures/       # Test data and fixtures
└── conftest.py     # Shared test configuration
```

### Running Tests

```bash
# Run all tests
make test

# Run specific test file
poetry run pytest tests/unit/test_character_agent.py -v

# Run with coverage
poetry run pytest --cov=stylus --cov-report=html
```

### Writing Tests

- **Unit Tests**: Test individual functions and classes
- **Integration Tests**: Test agent interactions
- **Property Tests**: Use Hypothesis for edge cases
- **Mock External APIs**: Don't hit real AI services in tests

Example test:

```python
def test_character_agent_creates_valid_profile():
    """Test that CharacterAgent creates valid character profiles."""
    agent = CharacterAgent()
    input_data = {"name": "Hero", "role": "protagonist"}

    result = agent.process(input_data, mock_context)

    assert isinstance(result, CharacterSchema)
    assert result.name == "Hero"
    assert result.role == CharacterRole.PROTAGONIST
```

## 📝 Documentation

### Documentation Structure

- **API Docs**: Auto-generated from docstrings
- **Tutorials**: Interactive Jupyter notebooks
- **Architecture**: System design and patterns
- **Contributing**: This guide

### Writing Documentation

```bash
# Build and serve docs locally
make docs

# Check for broken links
poetry run mkdocs build --strict
```

### Docstring Format

Use Google-style docstrings:

```python
def create_character(name: str, traits: List[str]) -> CharacterSchema:
    """Create a character profile from basic information.

    Args:
        name: The character's name
        traits: List of personality traits

    Returns:
        CharacterSchema: Validated character profile

    Raises:
        ValidationError: If character data is invalid

    Example:
        >>> character = create_character("Hero", ["brave", "kind"])
        >>> character.name
        'Hero'
    """
```

## 🎨 Contributing Areas

### High-Priority Areas

1. **Agent Development**
   - Improve character consistency algorithms
   - Enhance story arc generation
   - Optimize panel layout logic

2. **Performance Optimization**
   - Caching strategies
   - Parallel processing
   - Memory management

3. **Quality Assurance**
   - Visual regression testing
   - Error handling improvements
   - User experience testing

### Good First Issues

Look for issues labeled:
- `good first issue` - Perfect for newcomers
- `help wanted` - Community input needed
- `documentation` - Improve docs and examples
- `testing` - Add test coverage

### Feature Requests

Before implementing new features:

1. **Check existing issues** - Avoid duplicates
2. **Create an issue** - Discuss the approach
3. **Get feedback** - Ensure alignment with project goals
4. **Start small** - Begin with MVP implementation

## 🔍 Code Review Process

### Submitting Pull Requests

1. **Create feature branch** from `main`
2. **Make focused changes** - One feature per PR
3. **Add tests** - Maintain coverage standards
4. **Update documentation** - Keep docs current
5. **Run quality checks** - `make dev` must pass
6. **Write clear description** - Explain what and why

### Review Criteria

- **Functionality**: Does it work as intended?
- **Code Quality**: Follows style guidelines?
- **Tests**: Adequate coverage and quality?
- **Documentation**: Clear and complete?
- **Performance**: No significant regressions?

### Review Timeline

- **Initial Response**: Within 2 business days
- **Full Review**: Within 1 week
- **Merge**: After approval and CI passes

## 🐛 Bug Reports

### Before Reporting

1. **Search existing issues** - Check for duplicates
2. **Test latest version** - Ensure bug still exists
3. **Minimal reproduction** - Create simple test case

### Bug Report Template

```markdown
**Bug Description**
Clear description of the issue

**Steps to Reproduce**
1. Step one
2. Step two
3. Step three

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Environment**
- OS: [e.g., macOS 14.0]
- Python: [e.g., 3.12.0]
- Stylus: [e.g., 0.1.0]

**Additional Context**
Screenshots, logs, etc.
```

## 🎉 Recognition

Contributors are recognized through:

- **GitHub Contributors** - Automatic recognition
- **Release Notes** - Major contributions highlighted
- **Hall of Fame** - Top contributors featured in docs

## 📞 Getting Help

- **GitHub Issues** - Bug reports and feature requests
- **GitHub Discussions** - Questions and community chat
- **Documentation** - Comprehensive guides and API reference

## 📄 License

By contributing to Stylus, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to Stylus!** Your efforts help democratize comic creation and empower creators worldwide. 🎨✨

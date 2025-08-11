.PHONY: install format lint typecheck test docs clean help

# Default target
help:
	@echo "Available commands:"
	@echo "  install    - Set up development environment with Poetry"
	@echo "  format     - Format code with Black and Ruff"
	@echo "  lint       - Run linting checks with Ruff"
	@echo "  typecheck  - Run static type checking with mypy"
	@echo "  test       - Run tests with pytest and coverage"
	@echo "  docs       - Build and serve documentation"
	@echo "  clean      - Remove build artifacts and caches"
	@echo "  security   - Run security checks"
	@echo "  pre-commit - Install and run pre-commit hooks"
	@echo "  version    - Show current version"
	@echo "  bump       - Bump version based on conventional commits"
	@echo "  release    - Create and publish release"
	@echo "  changelog  - Generate changelog from commits"

# Development environment setup
install:
	@echo "Setting up development environment..."
	poetry install --with dev,docs
	poetry run pre-commit install
	@echo "Development environment ready!"

# Code formatting
format:
	@echo "Formatting code..."
	poetry run black stylus tests
	poetry run ruff format stylus tests
	poetry run ruff check stylus tests --fix

# Linting
lint:
	@echo "Running linting checks..."
	poetry run ruff check stylus tests
	poetry run black --check stylus tests

# Type checking
typecheck:
	@echo "Running type checks..."
	poetry run mypy stylus

# Testing
test:
	@echo "Running tests..."
	poetry run pytest tests/ -v --cov=stylus --cov-report=term-missing --cov-report=html

# Documentation
docs:
	@echo "Building documentation..."
	poetry run mkdocs build
	@echo "Serving documentation at http://localhost:8000"
	poetry run mkdocs serve

# Security checks
security:
	@echo "Running security checks..."
	poetry run safety check
	poetry run bandit -r stylus/

# Pre-commit hooks
pre-commit:
	@echo "Running pre-commit hooks..."
	poetry run pre-commit run --all-files

# Semantic versioning
version:
	@echo "Current version:"
	poetry run semantic-release version --print

bump:
	@echo "Bumping version based on commits..."
	poetry run semantic-release version

release:
	@echo "Creating release..."
	poetry run semantic-release publish

changelog:
	@echo "Generating changelog..."
	poetry run semantic-release changelog

# Clean up
clean:
	@echo "Cleaning up build artifacts..."
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf .pytest_cache/
	rm -rf .coverage
	rm -rf htmlcov/
	rm -rf .mypy_cache/
	rm -rf .ruff_cache/
	rm -rf site/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	@echo "Clean complete!"

# Development workflow
dev: format lint typecheck test
	@echo "Development checks complete!"

# CI workflow
ci: lint typecheck test security
	@echo "CI checks complete!"

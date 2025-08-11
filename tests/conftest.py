"""Test configuration for Stylus

Shared fixtures and test utilities for the test suite.
"""

from collections.abc import Generator
from typing import Any

import pytest


@pytest.fixture()
def sample_text_input() -> dict[str, Any]:
    """Sample text input for testing comic generation."""
    return {
        "title": "The Rise of the Phoenix",
        "source": "Breaking news article about urban renewal",
        "characters": ["hero", "villain", "sidekick"],
        "style": "neo-noir",
    }


@pytest.fixture()
def mock_context() -> Generator[None, None, None]:
    """Mock comic context for testing."""
    # Will be implemented when ComicContext is created
    yield

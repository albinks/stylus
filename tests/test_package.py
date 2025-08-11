"""Test basic package functionality."""

from stylus import __author__, __version__


def test_package_version() -> None:
    """Test that package version is accessible."""
    assert __version__ == "0.1.0"


def test_package_author() -> None:
    """Test that package author is accessible."""
    assert __author__ == "Allen Amos-Binks"


def test_package_imports() -> None:
    """Test that package can be imported without errors."""
    import stylus
    import stylus.agents
    import stylus.core
    import stylus.schemas

    # Basic smoke test - no exceptions should be raised
    assert stylus is not None
    assert stylus.agents is not None
    assert stylus.schemas is not None
    assert stylus.core is not None

# Release Workflow Setup Guide

## Overview
The release workflow has been updated to be more robust with better error handling, debugging output, and conditional publishing based on token availability.

## Key Improvements Made

### 1. Version Compatibility
- Updated to `python-semantic-release@v9.8.3` for better stability
- Fixed configuration format in `pyproject.toml` to match v9.x requirements
- Added proper commit author configuration

### 2. Enhanced Error Handling
- Added checks for PyPI token availability before attempting to publish
- Made PyPI publishing conditional (won't fail if token is missing)
- Added Test PyPI publishing step (optional, continues on error)
- Improved debug output throughout the workflow

### 3. Better Debugging
- Added conventional commit checking step
- Added version and tag debugging information
- Added comprehensive workflow summary at the end
- All debug information is written to GitHub Step Summary

### 4. Token Management
- Uses `secrets.GITHUB_TOKEN` as fallback if `GH_TOKEN` not configured
- Checks for `PYPI_API_TOKEN` before attempting PyPI publish
- Supports optional `TEST_PYPI_API_TOKEN` for test publishing

## Required Setup Steps

### 1. Repository Secrets
Configure the following secrets in your GitHub repository settings:

#### Required for Full Functionality:
- **`PYPI_API_TOKEN`**: Your PyPI API token for publishing packages
  - Get from: https://pypi.org/manage/account/token/
  - Scope: Can be project-specific or account-wide

#### Optional:
- **`GH_TOKEN`**: Personal Access Token with enhanced permissions
  - Only needed if default `GITHUB_TOKEN` lacks permissions
  - Required permissions: `repo`, `write:packages`

- **`TEST_PYPI_API_TOKEN`**: Test PyPI token for testing releases
  - Get from: https://test.pypi.org/manage/account/token/
  - Useful for testing release process without affecting production

### 2. Initial Version Tag (if needed)
If your repository has no tags yet, create an initial version tag:

```bash
git tag v0.1.0
git push origin v0.1.0
```

### 3. Conventional Commits
The workflow requires conventional commits to determine version bumps:

- `feat:` or `feat():` - Minor version bump (0.1.0 → 0.2.0)
- `fix:` or `fix():` - Patch version bump (0.1.0 → 0.1.1)
- `BREAKING CHANGE:` in commit body - Major version bump (0.1.0 → 1.0.0)

Example commits:
```bash
git commit -m "feat: add character generation agent"
git commit -m "fix: resolve panel layout overflow issue"
git commit -m "docs: update API documentation"
```

## Workflow Behavior

### When a Release is Created:
1. Tests are run first
2. If tests pass and conventional commits exist:
   - Version is bumped based on commit types
   - CHANGELOG.md is updated
   - Git tag is created
   - GitHub Release is created
3. If `PYPI_API_TOKEN` is configured:
   - Package is built with Poetry
   - Published to Test PyPI (if token configured)
   - Published to PyPI

### When No Release is Created:
The workflow will still run but won't create a release if:
- No conventional commits since last release
- Only non-releasing commits (e.g., `chore:`, `ci:`)
- Tests fail

### Workflow Summary
After each run, check the workflow summary in GitHub Actions for:
- Release status (created or not)
- Version information
- Token availability status
- Reasons why release wasn't created (if applicable)

## Troubleshooting

### Common Issues and Solutions:

1. **"No release created" despite having commits**
   - Ensure commits follow conventional commit format
   - Check if commits are feat/fix/perf (releasing types)

2. **"PyPI publish failed"**
   - Verify `PYPI_API_TOKEN` is correctly set in repository secrets
   - Check token hasn't expired
   - Ensure package name isn't already taken on PyPI

3. **"Permission denied" errors**
   - Add `GH_TOKEN` with appropriate permissions
   - Ensure workflow has correct permissions block

4. **"Version already exists" on PyPI**
   - The workflow uses `skip-existing: true` to handle this
   - If persistent, manually bump version in pyproject.toml

## Testing the Workflow

To test without affecting production:

1. **Use workflow_dispatch**:
   - Go to Actions tab → Release workflow → Run workflow
   - This allows manual triggering for testing

2. **Test with Test PyPI**:
   - Configure `TEST_PYPI_API_TOKEN`
   - Verify package uploads correctly to test.pypi.org

3. **Check Debug Output**:
   - Review the workflow summary after each run
   - Check individual step outputs for detailed information

## Next Steps

1. Add repository secrets as described above
2. Make a conventional commit (e.g., `fix: update release workflow`)
3. Push to main branch
4. Monitor the Actions tab for workflow execution
5. Check the workflow summary for detailed results

## Additional Resources

- [Python Semantic Release Documentation](https://python-semantic-release.readthedocs.io/)
- [Conventional Commits Specification](https://www.conventionalcommits.org/)
- [PyPI API Tokens Guide](https://pypi.org/help/#apitoken)
- [GitHub Actions Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)

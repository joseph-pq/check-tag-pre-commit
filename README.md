# Check tag pre-commit

This pre-commit hook check, before pushing to git remote, if the latest tag of
your Python project matches the version in the `__version__` attribute of your
package at the time of the commit.


## Installation

Add the following to your `.pre-commit-config.yaml`:

```yaml
-   repo: https://github.com/joseph-pq/check-tag-pre-commit
    rev: # set the version you required
    hooks:
    -   id: check-version-tag
```

## Usage

After installing the hook, you can run it manually with:

```bash
pre-commit run check-version-tag
```

---
title: pre-commit
layout: minimal
---

<!-- markdownlint-disable MD025 -->
# Make consistent good commits with `pre-commit`
<!-- markdownlint-enable MD025 -->

This project makes use of [`git hooks`](https://git-scm.com/docs/githooks) to ensure commited content adheres to current common practices and current style guidelines.
{: .fs-6 .fw-300 }

---

## What is `pre-commit`?

In a nutshell: `pre-commit` makes `git hooks` more usable across repositories where more than one person is working on. It easy to
[install](https://pre-commit.com/#install) and offers a simple yet thoroughly extensible [configuration file](https://pre-commit.com/#2-add-a-pre-commit-configuration).

`pre-commit` hooks are an easy way to verify changes locally prior to commiting them. This helps to reduce the number of commits as *all* `pre-commit` hooks are enforced
through continous integration (CI) pipelines in GitHub.

---

<!-- markdownlint-disable MD022 -->
## Table of contents
{: .no_toc .text-delta }
<!-- markdownlint-enable MD022 -->

- TOC
{:toc}

## Hooks in use

`pre-commit` allows to reference hooks from other repositories. Some repositories of tools used in this repository (e.g. [`renovate`](https://github.com/renovatebot/renovate)
or [`yamllint`](https://github.com/adrienverge/yamllint) provide a [hook configuration](https://pre-commit.com/#creating-new-hooks) (defined in `.pre-commit-hooks.yaml`) out
of the box, while some tools do not. For such cases, individuals can step up and create a repository solely for the purpose of serving a `.pre-commit-hooks.yaml` configuration,
which enables users of `pre-commit` to share their hook configuration.

Within the next few sections all repositories utilized by this project are listed and their purpose for this project described.

In each section, you'll find the [`pre-commit` hook IDs](https://pre-commit.com/#config-id) that are utilized of the respective repository and in which
[stages](https://pre-commit.com/#confining-hooks-to-run-at-certain-stages).

### Repository <https://github.com/ansible/ansible-lint>

| Hook IDs                                                                         | `pre-commit` stages                                                              |
| :------------------------------------------------------------------------------- | :------------------------------------------------------------------------------- |
| `ansible-lint`                                                                   | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |

This hook is used to validate Ansible `YAML` code using [Ansible Lint](https://ansible.readthedocs.io/projects/lint/). The configuration this hook uses is stored in `.ansible-lint`
in the root of the repository.

Under the hood Ansible Lint calls [`yamllint`](https://github.com/adrienverge/yamllint) to verify `YAML` files. This means that the configuration for `yamllint`, which is
stored in the root of the repository in `.yamllint`, is also applied by Ansible Lint for Ansible-specific files.

Ansible Lint needs to check all Ansible related files, not just the ones that changed, as it otherwise leads to
[false-positives](https://github.com/ansible/ansible-lint/issues/611). This, however, means that Ansible Lint will take much more time - especially the more Ansible related
files are in the repository - as it needs to check all Ansible-related files on every commit.

### Repository <https://github.com/pre-commit/pre-commit-hooks>

| Hook IDs                                                                         | `pre-commit` stages                                                              |
| :------------------------------------------------------------------------------- | :------------------------------------------------------------------------------- |
| `check-executables-have-shebangs`                                                | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `check-merge-commit`                                                             | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `check-json`                                                                     | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `check-shebang-scripts-are-executables`                                          | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `check-symlinks`                                                                 | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `check-toml`                                                                     | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `check-xml`                                                                      | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `debug-statements`                                                               | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `destroyed-symlinks`                                                             | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `detect-private-key`                                                             | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `end-of-file-fixer`                                                              | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `mixed-line-ending`                                                              | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `pretty-format-json`                                                             | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |
| `trailing-whitespace`                                                            | [`pre-commit`](https://pre-commit.com/#pre-commit)                               |

These hooks are officially from the `pre-commit` community and they contain all sorts of useful checks.

Each of them is described and documented in the [repository](https://github.com/pre-commit/pre-commit-hooks) they are pulled from.

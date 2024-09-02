# file_deployment

This is a *very* simple role that will copy files to the managed nodes using `ansible.builtin.copy`.

## Badges

<!-- markdownlint-disable MD013 -->
| Badge |
| :---- |
| [![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org) |
| [![gitleaks](https://img.shields.io/badge/gitleaks-enabled-blue.svg)](https://github.com/gitleaks/gitleaks) |
| [![License: GPL v2](https://img.shields.io/badge/License-GPL_v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) |
| [![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/sscheib/ansible-role-file_deployment/badge)](https://scorecard.dev/viewer/?uri=github.com/sscheib/ansible-role-file_deployment) |
| [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit) |
| [![renovate](https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovatebot)](https://github.com/apps/renovate) |
| [![role downloads](https://img.shields.io/ansible/role/d/sscheib/file_deployment)](https://galaxy.ansible.com/ui/standalone/roles/sscheib/file_deployment) |
| [![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release) |
<!-- markdownlint-enable MD013 -->

Workflow badges are in a [separate section](#workflow-badges) to not clutter this section.

## Tested Ansible Core versions and operating systems

This role is tested using [`molecule`](https://ansible.readthedocs.io/projects/molecule/). Please take a look at our [documentation](docs/molecule_tests.md) to read more about it.

## Role Variables

| variable                                     | default                      | required | description                                                                    |
| :---------------------------------           | :--------------------------- | :------- | :----------------------------------------------------------------------------- |
| `fd_files`                                   | unset                        | true     | Files to deploy. See below for an extended example how to define it            |
| `fd_quiet_assert`                            | `false`                      | false    | Whether to quiet the assert statements                                         |

## Variable `fd_files`

An extended example of only the `fd_files` variable is illustrated down below:

```yaml
fd_files:
  - src: 'sshd_motd'
    dest: '/etc/motd'
    owner: 'root'
    group: 'root'
    mode: '0644'

  - src: 'sshd_issue.net'
    dest: '/etc/issue.net'
    owner: 'root'
    group: 'root'
    mode: '0644'

  - content: >-
      This is my text
    dest: '/home/steffen/test'
    owner: 'steffen'
    group: 'steffen'
    mode: '0400'
```

The attributes `dest`, `owner`, `group` and `mode` are required as well as either `src` or `content`.

The permission attributes are deliberately enforced (although `ansible.builtin.copy` does not require them) to avoid accidental unsafe file deployments which have too
broad permissions. This way, a user needs to consciously decide to set broad permissions.

Type validation for each variable and/or variable option is done using
[role argument validation](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#role-argument-validation). The corresponding specification is
defined in [`meta/argument_specs.yml`](meta/argument_specs.yml).

This role supports all attributes of [`ansible.builtin.copy`](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html) being passed in as option
in `fd_files`.

The role's argument specification does not replicate all the documentation specified in `ansible.builtin.copy` as it is mainly used for type checking and type enforcement.
The complete documentation of each of the options possible can be reviewed at the
[documentation of `ansible.builtin.copy`](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html)

## Dependencies

None

## Example Playbook

```yaml
---
- name: 'Deploy files'
  hosts: 'all'
  gather_facts: false
  roles:
    - role: 'file_deployment'
      vars:
        fd_quiet_assert: false
        fd_files:
          - src: 'sshd_motd'
            dest: '/etc/motd'
            owner: 'root'
            group: 'root'
            mode: '0644'

          - src: 'sshd_issue.net'
            dest: '/etc/issue.net'
            owner: 'root'
            group: 'root'
            mode: '0644'

          - content: >-
              This is my text
            dest: '/home/steffen/test'
            owner: 'steffen'
            group: 'steffen'
            mode: '0400'
...
```

## Contributing

First off, thanks for taking the time to contribute! ❤️

All types of contributions are encouraged and valued.
Please see [`CONTRIBUTING.md`](docs/CONTRIBUTING.md) for different ways to help and details about how this project handles contributions.

## Workflow badges

<!-- markdownlint-disable MD013 -->
| Workflow name   |
| :-------------- |
| [![Ansible Galaxy publish](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/release.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/release.yml) |
| [![ansible-lint](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/ansible-lint.yml) |
| [![commitlint](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/commitlint.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/commitlint.yml) |
| [![Container image retention](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/container_image_retention.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/container_image_retention.yml) |
| [![Dependency Review](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/dependency_review.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/dependency_review.yml) |
| [![Docs image build](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/docs_image.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/docs_image.yml) |
| [![GitHub pages deployment](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/github_pages.yml/badge.svg?branch=main)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/github_pages.yml) |
| [![gitleaks](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/gitleaks.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/gitleaks.yml) |
| [![hadolint](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/hadolint.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/hadolint.yml) |
| [![KICS](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/kics.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/kics.yml) |
| [![markdown link check](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/markdown-link-check.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/markdown-link-check.yml) |
| [![markdownlint](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/markdownlint.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/markdownlint.yml) |
| [![molecule certified EEs](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/molecule_certified_ees.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/molecule_certified_ees.yml) |
| [![molecule community EEs](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/molecule_community_ees.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/molecule_community_ees.yml) |
| [![pre-commit](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/pre-commit.yml) |
| [![pyspelling](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/pyspelling.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/pyspelling.yml) |
| [![Renovate](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/renovate.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/renovate.yml) |
| [![Scorecard](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/scorecard.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/scorecard.yml) |
| [![Trivy](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/trivy.yml/badge.svg)](https://github.com/sscheib/ansible-role-file_deployment/actions/workflows/trivy.yml) |
<!-- markdownlint-enable MD013 -->

## License

[`GPL-2.0-or-later`](LICENSE)

# Test scenarios

This role is tested with [`molecule`](https://ansible.readthedocs.io/projects/molecule/) using containers as both the control node and managed node operating system.

Tests are performed in Red Hat's
[certified Automation Execution Environments (`EEs`)](https://catalog.redhat.com/search?searchType=containers&build_categories_list=Automation%20execution%20environment&p=1) and
in both the  [Ansible Community Execution Environments](https://github.com/orgs/ansible-community/packages/container/package/community-ee-minimal) and the
[Ansible Dev Tools Execution Environment](https://github.com/ansible/ansible-dev-tools/pkgs/container/community-ansible-dev-tools).

While this choice seems redundant, the community based `EEs` are run right when a pull request is created, whereas the certified `EEs` require an additional approval from a
code owner.The reason for this choice is because certified `EEs` need to be pulled from Red Hat's container registry, which requires access to secrets. To prevent leakage
of the credentials used to authenticate an approval is required (which involves checking the code) prior to running the workflow on the certified `EEs`.

To give contributors immediate feedback about the `molecule` tests, the community `EEs` are used.

The Red Hat certified `EEs` do not ship `molecule` or `podman` by default which requires installing both before executing the tests. The `molecule` version is pinned on the
latest available version and installed with `pip` from `pypi.org` (and kept up-to-date using [`renovate`](https://github.com/renovatebot/renovate)) while `podman` is installed
from the `UBI` packages with whatever version of `podman` is currently available on the respective `UBI`.

The Ansible Community Execution Environments also do not ship `molecule` or `podman` by default which requires installing both before executing tests. Additionally, the
Ansible Community `EEs` need to be configured to allow `podman` to run which is done prior to testing.

The `molecule` version is pinned on the latest available version and installed with `pip` from `pypi.org` (and kept up-to-date using
[`renovate`](https://github.com/renovatebot/renovate)) while `podman` is installed from the Fedora packages with whatever version of `podman` is currently available.

The reason for not pinning the `podman` version on both the certified `EEs` and the community `EEs` is primarily that it wouldn't bring any meaningful benefit but also
because `renovate` cannot keep RHEL packages up-to-date in a reasonable way. Theoretically, it would work for Fedora packages, but - as said - it wouldn't bring a
meaningful benefit.

Lastly, the Ansible Dev Tools `EE` ships with both `podman` and `molecule` and we use whatever versions the `EE` ships.

Below you'll find the complete test matrix for molecule.

## RHEL 9 (UBI) operating system control node

| Operating system control node | Operating system managed node | Ansible Core Version | Automation Execution Environment name                       |
| :---------------------------- | :---------------------------- | :------------------- | :---------------------------------------------------------- |
| RHEL 9 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel9:2.18.5-1`     |
| RHEL 9 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel9:2.18.5-1`     |
| RHEL 9 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel9:2.18.5-1`     |
| RHEL 9 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel9:2.18.5-1`     |
| RHEL 9 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel9:2.18.5-1`     |
| RHEL 9 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel9:2.18.5-1`     |
| RHEL 9 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel9:2.17.11-2`     |
| RHEL 9 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel9:2.17.11-2`     |
| RHEL 9 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel9:2.17.11-2`     |
| RHEL 9 (UBI)                  | Debian 10 (Buster)            | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel9:2.17.11-2`     |
| RHEL 9 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel9:2.17.11-2`     |
| RHEL 9 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel9:2.17.11-2`     |
| RHEL 9 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel9:2.17.11-2`     |
| RHEL 9 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | RHEL 8 (UBI)                  | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | RHEL 7 (UBI)                  | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | Debian 10 (Buster)            | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel9:2.16.14-18`     |
| RHEL 9 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |
| RHEL 9 (UBI)                  | RHEL 8 (UBI)                  | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |
| RHEL 9 (UBI)                  | RHEL 7 (UBI)                  | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |
| RHEL 9 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |
| RHEL 9 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |
| RHEL 9 (UBI)                  | Debian 10 (Buster)            | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |
| RHEL 9 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |
| RHEL 9 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |
| RHEL 9 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel9:2.15.13-19`    |

## RHEL 8 (UBI) operating system control node

| Operating system control node | Operating system managed node | Ansible Core Version | Automation Execution Environment name                       |
| :---------------------------- | :---------------------------- | :------------------- | :---------------------------------------------------------- |
| RHEL 8 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.18    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | Debian 10 (Buster)            | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.17    | `ansible-automation-platform/ee-minimal-rhel8:2.18.5-2`     |
| RHEL 8 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | RHEL 8 (UBI)                  | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | RHEL 7 (UBI)                  | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | Debian 10 (Buster)            | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.16    | `ansible-automation-platform/ee-minimal-rhel8:2.16.14-17`     |
| RHEL 8 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | RHEL 8 (UBI)                  | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | RHEL 7 (UBI)                  | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | Debian 10 (Buster)            | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.15    | `ansible-automation-platform/ee-minimal-rhel8:2.15.13-20`    |
| RHEL 8 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | RHEL 8 (UBI)                  | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | RHEL 7 (UBI)                  | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | Debian 10 (Buster)            | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.14    | `ansible-automation-platform/ee-minimal-rhel8:2.14.13-31`    |
| RHEL 8 (UBI)                  | RHEL 9 (UBI)                  | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |
| RHEL 8 (UBI)                  | RHEL 8 (UBI)                  | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |
| RHEL 8 (UBI)                  | RHEL 7 (UBI)                  | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |
| RHEL 8 (UBI)                  | Debian 12 (Bookworm)          | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |
| RHEL 8 (UBI)                  | Debian 11 (Bullseye)          | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |
| RHEL 8 (UBI)                  | Debian 10 (Buster)            | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |
| RHEL 8 (UBI)                  | OpenWrt 23.05                 | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |
| RHEL 8 (UBI)                  | OpenWrt 22.03.5               | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |
| RHEL 8 (UBI)                  | OpenWrt 21.02.7               | Ansible Core 2.13    | `ansible-automation-platform/ee-minimal-rhel8:2.13.10-44`   |

## Ansible Community Execution Environments

The Ansible Community `EEs` are based on the latest version of Fedora and the latest Ansible Core version, but older versions are available. As
long as the Ansible Core version is expected to
[receive updates](https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html#ansible-core-support-matrix) the
respective `EEs` will be tested as well.

An exception to that is the `EE` `ansible-community/community-ee-base:2.15` which is *somewhat* broken. It appears to have a broken manifest
which prevents adding it to the tested scenarios, as all `EE` versions should be referenced with a `SHA256` digest.

| Operating system control node | Operating system managed node | Ansible Core Version | Automation Execution Environment name                 |
| :---------------------------- | :---------------------------- | :------------------- | :---------------------------------------------------- |
| Fedora 41                     | RHEL 9 (UBI)                  | Ansible Core 2.18    | `ansible-community/community-ee-base:2.18.5-1`        |
| Fedora 41                     | Debian 12 (Bookworm)          | Ansible Core 2.18    | `ansible-community/community-ee-base:2.18.5-1`        |
| Fedora 41                     | Debian 11 (Bullseye)          | Ansible Core 2.18    | `ansible-community/community-ee-base:2.18.5-1`        |
| Fedora 41                     | OpenWrt 23.05                 | Ansible Core 2.18    | `ansible-community/community-ee-base:2.18.5-1`        |
| Fedora 41                     | OpenWrt 22.03.5               | Ansible Core 2.18    | `ansible-community/community-ee-base:2.18.5-1`        |
| Fedora 41                     | OpenWrt 21.02.7               | Ansible Core 2.18    | `ansible-community/community-ee-base:2.18.5-1`        |
| Fedora 40                     | RHEL 9 (UBI)                  | Ansible Core 2.17    | `ansible-community/community-ee-base:2.17.7-1`        |
| Fedora 40                     | Debian 12 (Bookworm)          | Ansible Core 2.17    | `ansible-community/community-ee-base:2.17.7-1`        |
| Fedora 40                     | Debian 11 (Bullseye)          | Ansible Core 2.17    | `ansible-community/community-ee-base:2.17.7-1`        |
| Fedora 40                     | OpenWrt 23.05                 | Ansible Core 2.17    | `ansible-community/community-ee-base:2.17.7-1`        |
| Fedora 40                     | OpenWrt 22.03.5               | Ansible Core 2.17    | `ansible-community/community-ee-base:2.17.7-1`        |
| Fedora 40                     | OpenWrt 21.02.7               | Ansible Core 2.17    | `ansible-community/community-ee-base:2.17.7-1`        |
| Fedora 40                     | RHEL 9 (UBI)                  | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |
| Fedora 40                     | RHEL 8 (UBI)                  | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |
| Fedora 40                     | RHEL 7 (UBI)                  | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |
| Fedora 40                     | Debian 12 (Bookworm)          | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |
| Fedora 40                     | Debian 11 (Bullseye)          | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |
| Fedora 40                     | Debian 10 (Buster)            | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |
| Fedora 40                     | OpenWrt 23.05                 | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |
| Fedora 40                     | OpenWrt 22.03.5               | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |
| Fedora 40                     | OpenWrt 21.02.7               | Ansible Core 2.16    | `ansible-community/community-ee-base:2.16.7-1`        |

## Ansible Dev Tools Execution Environment

The Ansible Dev Tools `EEs` are based on the latest version of Fedora (currently 40) and the latest Ansible Core version. They are bundled
with `molecule` and do not *seem* to support multiple versions of Ansible Core, which is why only the latest `EE` version will be used to test.

| Operating system control node | Operating system managed node | Ansible Core Version | Automation Execution Environment name                 |
| :---------------------------- | :---------------------------- | :------------------- | :---------------------------------------------------- |
| Fedora 40                     | RHEL 9 (UBI)                  | Ansible Core 2.17    | `ansible/community-ansible-dev-tools:v25.4.0`         |
| Fedora 40                     | Debian 12 (Bookworm)          | Ansible Core 2.17    | `ansible/community-ansible-dev-tools:v25.4.0`         |
| Fedora 40                     | Debian 11 (Bullseye)          | Ansible Core 2.17    | `ansible/community-ansible-dev-tools:v25.4.0`         |
| Fedora 40                     | Debian 10 (Buster)            | Ansible Core 2.17    | `ansible/community-ansible-dev-tools:v25.4.0`         |
| Fedora 40                     | OpenWrt 23.05                 | Ansible Core 2.17    | `ansible/community-ansible-dev-tools:v25.4.0`         |
| Fedora 40                     | OpenWrt 22.03.5               | Ansible Core 2.17    | `ansible/community-ansible-dev-tools:v25.4.0`         |
| Fedora 40                     | OpenWrt 21.02.7               | Ansible Core 2.17    | `ansible/community-ansible-dev-tools:v25.4.0`         |

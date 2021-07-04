# OmniOSCE Packer

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)](./docs/code_of_conduct.md) [![Omniosce](https://img.shields.io/badge/OmniOSCE-r151038-success)](https://omnios.org) [![VirtualBox](https://img.shields.io/badge/VirtualBox-6.1-success)](https://www.virtualbox.org) [![Packer](https://img.shields.io/badge/Packer-1.6.5-success)](https://www.packer.io) [![Vagrant](https://img.shields.io/badge/Vagrant-2.2.10-success)](https://www.vagrantup.com)

Auto-configured  version of OmniOSCE-r151038 using Packer and Vagrant.

<div>
    <a href="./packer_templates/omniosce-r151038.pkr.hcl" style="text-decoration: none">
        <img src="https://img.shields.io/badge/Packer%20template-blue?style=flat-square" align="left">
    </a>
    <a href="./Makefile" style="text-decoration: none">
        <img src="https://img.shields.io/badge/Makefile-blue?style=flat-square" align="left">
    </a>
    <a href="./Vagrantfile" style="text-decoration: none">
        <img src="https://img.shields.io/badge/Vagrantfile-blue?style=flat-square" align="left">
    </a>
    <a href="./docs/issue_template_detailed.md" style="text-decoration: none">
        <img src="https://img.shields.io/badge/Issue%20template-yellow?style=flat-square" align="right">
    </a>
    <a href="./docs/pull_request_template_detailed.md" style="text-decoration: none">
        <img src="https://img.shields.io/badge/Pull%20request%20template-yellow?style=flat-square" align="right">
    </a>
    <a href="./docs/code_of_conduct.md" style="text-decoration: none">
        <img src="https://img.shields.io/badge/Code%20of%20conduct-yellow?style=flat-square" align="right">
    </a>
    <a href="./docs/contributing.md" style="text-decoration: none">
        <img src="https://img.shields.io/badge/Contributing-yellow?style=flat-square" align="right">
    </a>
    <br>
</div>


## Contents
 * [Prerequisites](#prerequisites)
 * [Usage](#usage)
 * [Note](#note)
 * [License](#license)

## Prerequisites

- Makefile
- Packer
- Vagrant
- Virtual Box

## Usage

To download the repository:

```bash
git clone https://github.com/STORViX/omniosce-packer.git -b main
```

To create the .box and start a vagrant machine:

```bash
make run
```

To clean the environment

```bash
make clean
```

## Note

- If the packer fails to create the .box , it’s very probably that you have to increase the timer in the boot_command section of packer_templates and re-run the make command, example:

  ```
  <wait1> —> <wait5>
  ```



## License

[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)

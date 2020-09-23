# Palo Alto post configuration with puppet bolt

## Description

Puppet bolt is an ad hoc task running tool that can be used to set "one off" desired state configurations. Bolt is used in this folder to perform an initial configuration of a newly deployed Palo Alto firewall.

## Installation

Checkout Puppets documentation to [download Bolt](https://puppet.com/docs/bolt/latest/bolt_installing.html)

Checkout the Puppet Forge on how to use the [panos module](https://forge.puppet.com/puppetlabs/panos)

To configure puppet bolt to run against the correct Palo Alto go to the [inventory](inventory.yml) and change the IP address, username, and password to the Palo Alto you wish to target

## Usage

### Training

For training on how to use the contents of the folder please follow the Puppet provided training located in the [modules folder](./modules/panos/docs/01-using-with-bolt).

### Configuration

All configurations that will be applied are located in the [manifest file](./manifest/manifest.pp). To understand what all the resource types are doing please refer back to the installation section and follow the link to the Puppet Forge

### Execution

To perform a "dry run" to validate which changes will take place:

``` bash
bolt apply ./manifest/manifest.pp --targets pan --noop
```

To apply and run the manifest file:

```bash
bolt apply ./manifest/manifest.pp --targets pan
```

To commit the changes to the palo alto:

```bash
bolt task run panos::commit --targets pan
```

## Contribute

To contribute please create a new feature branch and submit a pull request. A maintainer will review and provide feedback in a timely manner. If you do not receive feedback on your pull request within 3 business days please feel free to email or teams a maintainer directly

## Maintainers

- Caige Kelly

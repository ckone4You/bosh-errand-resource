# BOSH Errand Resource

Run bosh errand(s) in concourse.

## Source Configuration

* `target`: *Required.* The address of the BOSH director which will be used for
  the deployment.
* `client_id`: *Required.* Username or UAA client.
* `client_secret`: *Required.* Password or UAA client secret.
* `deployment`: *Required.* The name of the deployment.
* `ca_cert`: *Optionnal (but mostly always required).* Director CA certificate path or value.


## Behaviour

### `out`: Run errand

#### Parameters

* `errand`: *Required.* Name of errand to be ran.

* `keep_alive`: *Default: False.* Keeps VM around where errand was executing.

* `when_changed`: *Default: False.* Indicates whether to skip running an errand if it previously ran (successfully finished) and errand job configuration did not change.

## Example

``` yaml
resource_types:
- name: bosh-errand
  type: docker-image
  source:
    repository: orangeopensource/bosh-errand-resource
resources:
- name: errand
  type: bosh-errand
  source:
    target: bosh.example.com
    client_id: admin
    client_secret: admin
    deployment: staging-deployment-name
jobs:
- name: build-rootfs
  plan:
  - put: staging
    params:
      errand: smoke-tests
      keep_alive: false
      when_changed: false
```

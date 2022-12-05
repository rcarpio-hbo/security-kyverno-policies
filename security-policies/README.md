# security-kyverno-policies

This helm chart contains a set of Kyverno policies to secure a Kubernetes cluster.

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![AppVersion: 1.0.1](https://img.shields.io/badge/AppVersion-1.0.1-informational?style=flat-square)

## Adding  the Chart

Before installing the chart, add the `security-policies` charts repository:
```console
$ helm repo add security-policies https://rcarpio-hbo.github.io/security-kyverno-policies/
$ helm repo update
```
## Installing the Chart

To install the chart with the release name `policies` in namespace `security-policies` run:

```console
$ helm install policies security-policies/security-kyverno-policies --namespace security-policies --create-namespace
```

## Available Rules

<!-- BEGIN_CURRENT_LTS -->
- **best-practices**
   - [disallow-latest-tag.yaml](./template/best-practices/disallow-latest-tag.yaml)
- **pod-security-standards**
   - [disallow-privilege-escalation.yaml](./template/pod-security-standards/disallow-privilege-escalation.yaml)
   - [disallow-privileged-containers.yaml](./template/pod-security-standards/disallow-privileged-containers.yaml)
<!-- END_AVAILABLE_RULES -->

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| disallowLatestTag.enable | bool | `false` | If true, _disallowLatestTag_ policy enabled  |
| disallowLatestTag.validationFailureAction | string | `""` | Rule type: enforce or audit |
| disallowPrivilegeEscalation.enable | bool | `false` | If true, _disallowPrivilegeEscalation_ policy enabled  |
| disallowPrivilegeEscalation.validationFailureAction | string | `""` | Rule type: enforce or audit |
| disallowPrivilegedContainers.enable | bool | `false` | If true, _disallowPrivilegedContainers_ policy enabled  |
| disallowPrivilegedContainers.validationFailureAction | string | `""` | Rule type: enforce or audit |
| global.enableAll | bool | `false` | Enable all available rules from this helm chart: false or true. |
| global.validationFailureAction | string | `""` | Rule type for all rules: enforce or audit |

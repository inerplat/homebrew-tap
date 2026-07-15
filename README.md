# Inerplat Homebrew Tap

Install WireKube's cluster lifecycle CLI on macOS or Linux:

```sh
brew install inerplat/tap/wirekube
wirekubectl install --dry-run --kubeconfig ~/.kube/config
```

Install Idleloom on an Apple Silicon Mac:

```sh
brew install inerplat/tap/idleloom
```

Upgrade either CLI:

```sh
brew upgrade inerplat/tap/wirekube
brew upgrade inerplat/tap/idleloom
```

After upgrading `wirekubectl`, run `wirekubectl upgrade` against each managed
cluster to reconcile the released image digest and installation resources.

Project documentation is available at:

- [WireKube](https://inerplat.github.io/wirekube/)
- [Idleloom](https://github.com/inerplat/idleloom)

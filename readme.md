# elva-labs homebrew tap

## Packages

- [awsesh](https://github.com/elva-labs/awsesh) — formula
- [awsesh-desktop](https://github.com/elva-labs/awsesh/tree/main/packages/desktop) — cask (Sesh, Apple Silicon, macOS 13+)
- [toybox](https://github.com/elva-labs/toybox) — formula
- [agent-workbench-remote](https://github.com/elva-labs/agent-workbench) — formula
- [claude-stats](https://github.com/elva-labs/claude-stats) — cask
- [all-the-ports](https://github.com/elva-labs/all-the-ports) — cask
- [authreach](https://github.com/elva-labs/authreach) — cask
- [sesh-bar](https://github.com/elva-labs/sesh-bar) — cask
- [daily-log](https://github.com/elva-labs/daily_log) — cask
- [agent-workbench](https://github.com/elva-labs/agent-workbench) — cask

## Installation

To install the tap, run the following command:

```bash
brew tap elva-labs/elva
brew trust elva-labs/elva   # newer Homebrew refuses third-party taps until trusted
```

Then install the desired package, ex:

```bash
brew install awsesh
```

Apps are casks:

```bash
brew install --cask claude-stats
brew install --cask awsesh-desktop
```

The awsesh formula installs the CLI. The awsesh-desktop cask installs `Sesh.app`
into `/Applications` without requiring the CLI, Bun or Node. Uninstalling the
cask leaves shared AWS credentials and awsesh configuration intact.

## Contributing

Awsesh's release workflow pushes its CLI formula here. This repository polls
claude-stats and awsesh desktop releases hourly to update their casks; both
workflows can also be started manually. The desktop updater accepts only newer
public stable releases with a desktop ZIP and `SHA256SUMS`, verifies the ZIP's
checksum and preserves the rest of the cask definition. It uses this repository's
`GITHUB_TOKEN`, not a cross-repository token or Apple signing secrets.

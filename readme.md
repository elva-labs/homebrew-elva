# elva-labs homebrew tap

## Packages

- [awsesh](https://github.com/elva-labs/awsesh) — formula
- [claude-stats](https://github.com/elva-labs/claude-stats) — cask
- [all-the-ports](https://github.com/elva-labs/all-the-ports) — cask
- [authreach](https://github.com/elva-labs/authreach) — cask
- [daily-log](https://github.com/elva-labs/daily_log) — cask

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
```

## Contributing

Each formula and cask is updated automatically: awsesh's release workflow pushes its formula here, and this repository polls claude-stats' releases hourly to update its cask.

# roune/homebrew-tap

Homebrew tap for [agent-memory](https://github.com/roune/agent-memory): a CLI that files coding-agent sessions and git history into a local inbox, and sends what a person approves to a memory server.

## Install

```sh
brew install roune/tap/agent-memory
```

The formula ships with v0.2.0. Tap Trust is on by default, and the line above works directly. To install by short name, trust the formula first:

```sh
brew tap roune/tap
brew trust --formula roune/tap/agent-memory
brew install agent-memory
```

The formula installs only the CLI. `agent-memory setup` then starts the server in Docker, so you need a Docker runtime: Docker Desktop, OrbStack or colima. Docker isn't a formula dependency, because people choose their own runtime.

```sh
agent-memory setup
agent-memory install   # connects editor hooks, after a yes
```

Upgrade with `brew upgrade agent-memory`, then run `agent-memory setup` again to upgrade the server.

## Documentation

See the [agent-memory repository](https://github.com/roune/agent-memory) and its [deploy guide](https://github.com/roune/agent-memory/blob/main/docs/deploy.md).

## agent-memory's license

agent-memory is licensed under [PolyForm Noncommercial 1.0.0](https://polyformproject.org/licenses/noncommercial/1.0.0).

## Publishing bottles

After a bump PR is green, publish its bottles with `gh workflow run publish.yml -f pull_request=<N>`.

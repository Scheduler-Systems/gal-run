cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.674"
  sha256 arm:    "3d68f5cebd8c6d7f5921b86f14d44f1a4a304c1a4bb6ec43efa7dd19ac2e216a",
         x86_64: "494f8d7aff3fdc208a209f1de6692b3849065e849c75ab5a5a794a4800041867"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.674/gal-#{version}-darwin-#{arch}.tar.gz"
  name "GAL"
  desc "CLI for GAL — AI agent configuration governance"
  homepage "https://gal.run"

  livecheck do
    url :stable
    strategy :github_latest
  end

  binary "gal"

  zap trash: [
    "~/.gal",
    "~/.config/gal",
  ]
end

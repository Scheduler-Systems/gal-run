cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.438"
  sha256 arm:    "59f16d7bfd88e9b6dc13ce9588cbb63c567ec9b9d91bfd2fc40d9d00ed3e0538",
         x86_64: "ebe93107ff8030f57b2f8a0b31f3e514296ad170632fe3a8e69f8e2376b6a1ac"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.438/gal-#{version}-darwin-#{arch}.tar.gz"
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

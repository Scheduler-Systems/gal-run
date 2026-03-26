cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.347"
  sha256 arm:    "1be1298d285f98ad3cb310e46a066be88b114c6bbc36ac8784b11137b26dcc95",
         x86_64: "92faf9cde44a5bf4cf7cd33de70b63fe6b6229f7b0c5d5cd59358e5c5ea049fd"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.347/gal-#{version}-darwin-#{arch}.tar.gz"
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

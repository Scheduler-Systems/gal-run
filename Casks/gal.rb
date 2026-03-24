cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.323"
  sha256 arm:    "b3f95bda139251bf45915673f9fa8c6ef46e8dcc46c1ef1c8040c4cef3446440",
         x86_64: "4a05e49e6d9a8ff7873ffa216bf46f1214c169159673c29e916901081f3f5bf0"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.323/gal-#{version}-darwin-#{arch}.tar.gz"
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

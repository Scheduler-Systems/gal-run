cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.539"
  sha256 arm:    "6e1e4e5ac2de39936d542cdeb25b6cd32b0e7f3637e604deeed66fdfa97c1763",
         x86_64: "f1c6535e4abbd3a54787ad6020cb186259b52da66db0f8e3790ab7d1980f93b2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.539/gal-#{version}-darwin-#{arch}.tar.gz"
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

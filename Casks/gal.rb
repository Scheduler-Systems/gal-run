cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.340"
  sha256 arm:    "94929e164939f1785b7afb043cd5ccb13f153f2a26965eb336194929c38ceb78",
         x86_64: "3e31cc33b0cc4bdf73b091d0296b8a71b340ff6ba8f9d1a0a2eb1119f82ca383"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.340/gal-#{version}-darwin-#{arch}.tar.gz"
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

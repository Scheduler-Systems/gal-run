cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.418"
  sha256 arm:    "2f21fe92a3ebbe531c2be13b7858be220dd2de63d6db054d4c777339415dd13b",
         x86_64: "0848f3141c609a0dd29b8023ae8cc0bf1218d4fa8ba47b47b85329f9ac1b5d18"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.418/gal-#{version}-darwin-#{arch}.tar.gz"
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

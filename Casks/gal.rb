cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.458"
  sha256 arm:    "579aef0432bce36e4ae3b85d63c3fdd275e41d4f3d323eac5e99fa2a2b2523d2",
         x86_64: "fafa5e95fe0a0e77faad80ed7c857103195c022ce404f83d2d77a5f0ea7c6246"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.458/gal-#{version}-darwin-#{arch}.tar.gz"
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

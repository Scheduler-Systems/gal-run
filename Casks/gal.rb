cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.457"
  sha256 arm:    "3f0ceb5109c6f2b1c2d1aed563ce4049dd56e4e609b53c9f26fce4f9d922fd29",
         x86_64: "f47d541c04af4619811502cb0d95e62465cb69251873bf528a8d55e8923098cf"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.457/gal-#{version}-darwin-#{arch}.tar.gz"
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

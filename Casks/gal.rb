cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.509"
  sha256 arm:    "25c18692e1d2cb54e422d527a8b699e8903ef7fe8f0d0fedf96e788e2ea084b2",
         x86_64: "b721db994f6f5e53310aab2503a7d95919cadc5b09e63f070e53c166b41f2204"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.509/gal-#{version}-darwin-#{arch}.tar.gz"
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

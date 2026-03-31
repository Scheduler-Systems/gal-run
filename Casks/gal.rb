cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.470"
  sha256 arm:    "4983a0e17852cf4b2e3696c63168e6b093e8c74916d10000a5b51d130047bafa",
         x86_64: "8c9b07779be1f6a6ec5bf6665bac872f223510298d083328f797a64d3f99422c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.470/gal-#{version}-darwin-#{arch}.tar.gz"
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

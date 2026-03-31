cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.468"
  sha256 arm:    "e260d0db203356b574049417f343604d8a20792aad7099e8c9e523de0101f6b7",
         x86_64: "a738a3c0aed98dd68c5891de0953c543ff0c180146f37a7ec8bec7ca6f4a858b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.468/gal-#{version}-darwin-#{arch}.tar.gz"
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

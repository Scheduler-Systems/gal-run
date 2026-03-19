cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.306"
  sha256 arm:    "3ffb8599fe9d3351f6b328830efa7776010edd548d6641be1d21347edee115fd",
         x86_64: "412e573c6e220048e40135586f2ee41435b5b3f1b5787f9b3888b3a072804786"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.306/gal-#{version}-darwin-#{arch}.tar.gz"
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

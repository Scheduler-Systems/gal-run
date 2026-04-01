cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.524"
  sha256 arm:    "64dd1a5d7e294dc9f23667cda2890662b0fc3111c31b935bba77fc48a5ce4d0d",
         x86_64: "4c8254d0252e547c0dc6c6db9d54362d65aeb184110c5ca540d3634c181aa992"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.524/gal-#{version}-darwin-#{arch}.tar.gz"
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

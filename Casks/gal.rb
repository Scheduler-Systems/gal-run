cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.431"
  sha256 arm:    "fb1859133894e671a76a901b274da5bf3f991b830d7b5edbc96f354bb9acc7eb",
         x86_64: "db521f0ad6e619733b9da1ecd534932ec7d3a50da9dbbf2a0627121a31764c91"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.431/gal-#{version}-darwin-#{arch}.tar.gz"
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

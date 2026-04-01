cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.499"
  sha256 arm:    "db77ba19bf776ec00292ed2b35bca01daaeac1e3d54f9a251eb5873ac7da0f0b",
         x86_64: "adff8b46084a2ce1e165ab2764ef6aee90d2ebd57523fe48d573ac4359e37ef6"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.499/gal-#{version}-darwin-#{arch}.tar.gz"
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

cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.502"
  sha256 arm:    "560490468f188b4870957404f0d28ec2902653029bf2f8584ef987302acaa8bb",
         x86_64: "757d18cf07094908a548ba6f69123f557ccb7ce720801520e20f0a1d1d4b5ed8"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.502/gal-#{version}-darwin-#{arch}.tar.gz"
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

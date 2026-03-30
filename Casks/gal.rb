cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.422"
  sha256 arm:    "8e0f2e771483a0c62f4550d305f12dff737a1e8f08a79c2a808df62e7800b563",
         x86_64: "2193c67663f59f87534144b8d1be64e3584a678b8966cd9f3f7136d47231b599"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.422/gal-#{version}-darwin-#{arch}.tar.gz"
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

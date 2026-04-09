cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.562"
  sha256 arm:    "aeb17ea4c15c19578ea2f68f640e783ccb80206bf25d6a15382c3c7bf2702ca2",
         x86_64: "0960f3701d9b6be99ee934fe54f595b41965af0ae9e4233597c33c3bc79fa7eb"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.562/gal-#{version}-darwin-#{arch}.tar.gz"
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

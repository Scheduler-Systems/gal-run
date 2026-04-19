cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.603"
  sha256 arm:    "94717a440c6c2d182d3505fafd1a92b571039b5f2a7d5d2a354dcf6845100e8f",
         x86_64: "b69f5bec20ea951a4fa7a048ddc30a3e765846ec5a042c5cb336f6d81ab8f6ae"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.603/gal-#{version}-darwin-#{arch}.tar.gz"
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

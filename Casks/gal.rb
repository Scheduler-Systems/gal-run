cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.476"
  sha256 arm:    "9a5bbc3dae433095586802f13267adb0529b480344cf3f28e84d6cd7929d7277",
         x86_64: "2a8940e5ae6cbf2134795db53634e2a9a0c5f7f87e91b025b6359615639f6565"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.476/gal-#{version}-darwin-#{arch}.tar.gz"
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

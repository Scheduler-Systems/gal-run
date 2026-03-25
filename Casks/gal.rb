cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.327"
  sha256 arm:    "42e16267ab659d0f4001ca7a77b7427e08cde43c8f0b1802de1de368c59be116",
         x86_64: "6d6237e6b73bbeb3cc5dfbd1e890ddc5a3d8ae364d08ae4eadf9dcaacbb08c44"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.327/gal-#{version}-darwin-#{arch}.tar.gz"
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

cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.512"
  sha256 arm:    "e66ade80cf90818f8912bf19ee4df78694e30255f3504121f8ca6edebaa48090",
         x86_64: "7fafb97713ffc568fea5ad9fa909ff3b9d54767b40a404101848d9904bf671de"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.512/gal-#{version}-darwin-#{arch}.tar.gz"
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

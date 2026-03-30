cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.423"
  sha256 arm:    "bfe57d9ca78e3e7f7bf37ffd8a10425cd8b323106fda25f0e8a6a2a1842f0716",
         x86_64: "f526b2864c205f070a90d22be2458ccf32cb3df4f8f5ae6dfe6c092bbdd86228"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.423/gal-#{version}-darwin-#{arch}.tar.gz"
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

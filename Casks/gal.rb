cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.490"
  sha256 arm:    "c134d6b986d584af70ec5ff17e1183f8b481aeab91203bb18a3c8bb27fb9724d",
         x86_64: "75ab85552de8f75f06efe14f82ee68f31e208683ebfe9c23cf12eb45908a118c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.490/gal-#{version}-darwin-#{arch}.tar.gz"
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

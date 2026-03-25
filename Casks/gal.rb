cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.344"
  sha256 arm:    "4f086135acf561825bd796d8d4f74431df5314173a5ead75f66dd1185bf32da6",
         x86_64: "71d9cd2f96f865c6ec47f23f29ab07ef17165b72b467a15cb295a62518caeca7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.344/gal-#{version}-darwin-#{arch}.tar.gz"
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

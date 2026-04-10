cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.565"
  sha256 arm:    "c8de10283288b38a72308b331d813a791f059568f2141fbc56f44352fb8d24d0",
         x86_64: "61e4442cb8d79dfa51dbc1f819422ed22b9da7bb58b0bd52c3ea24f70751e719"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.565/gal-#{version}-darwin-#{arch}.tar.gz"
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

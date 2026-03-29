cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.403"
  sha256 arm:    "b351b18018af94b3c8850f02c39601596aacfd91076fef5fc9f8634888ee5c9c",
         x86_64: "001a128e29692d894d7283f96db86338baf57d387ffd145499bf9e26e2c8ccda"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.403/gal-#{version}-darwin-#{arch}.tar.gz"
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

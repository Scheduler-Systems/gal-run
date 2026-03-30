cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.426"
  sha256 arm:    "3c4253645b31ceec73c97320df62245e584953bfdf8f2dc1332a3a29eb80e481",
         x86_64: "679c372970deda98218ffc694b2a07e7aef4b2108d691396a4680efd807e983c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.426/gal-#{version}-darwin-#{arch}.tar.gz"
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

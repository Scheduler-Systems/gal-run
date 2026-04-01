cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.528"
  sha256 arm:    "ad44675e8b924969a2c295d31e05cf4d4cf55eb628e52d940cf40c1c0acd5799",
         x86_64: "2f0ff31683e4028223b1cc61cccbce07c2f3a13cd64480f0b133d7f95db3fd46"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.528/gal-#{version}-darwin-#{arch}.tar.gz"
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

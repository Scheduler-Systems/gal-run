cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.497"
  sha256 arm:    "9528ec360a7e3435fe59d96c30961890ead91897877233e216507e8c4fa29d1c",
         x86_64: "4f1876fd4bb7c92fca5e174e92ba69daa2b870a50444515917bb859fded0d2fe"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.497/gal-#{version}-darwin-#{arch}.tar.gz"
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

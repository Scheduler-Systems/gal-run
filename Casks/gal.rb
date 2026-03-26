cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.354"
  sha256 arm:    "a6954e48763de8c7ceeb4af22591d311970a490845634b65b6cfb632f0d90681",
         x86_64: "c69fdbdbecadff17fbbf3731d307ba1ba1556808e29412dbcecdcc908f89fa5e"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.354/gal-#{version}-darwin-#{arch}.tar.gz"
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

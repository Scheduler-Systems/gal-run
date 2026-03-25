cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.329"
  sha256 arm:    "0a72b11a4937aa9833d1446a95aad56e0d57f8f2cdcd7f1530b8250c5a55f515",
         x86_64: "38cdf99fcf977a2526f72ff35ac1fe55cc0ea99b7e135244274a0f92cde09ce5"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.329/gal-#{version}-darwin-#{arch}.tar.gz"
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

cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.358"
  sha256 arm:    "e08e6a13e540881a3647c83f40cfd9ddb12d5aa12512f3cc53b02630d187d3bb",
         x86_64: "9e1e19939b8732a35d5620e85f8abb3b9d27a6a7a98aa25872dd17e29c122ec8"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.358/gal-#{version}-darwin-#{arch}.tar.gz"
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

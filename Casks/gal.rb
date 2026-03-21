cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.318"
  sha256 arm:    "90d5b941afcf957beb5dfc59dfc0dfd899d7329128002a190f02617e1867360a",
         x86_64: "ae5e12d8083d3cf598235697848ad53c87c9d39a5205ade5f24b8761e074e8d9"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.318/gal-#{version}-darwin-#{arch}.tar.gz"
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

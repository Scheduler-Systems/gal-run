cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.420"
  sha256 arm:    "b52965496ce5c877692736c797944471c18c96af351e96e904350ebf047d8b66",
         x86_64: "3fdc95b3fcdaec2076f0b54052620b5ad1951df066647d0c873e1ca8e95c499e"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.420/gal-#{version}-darwin-#{arch}.tar.gz"
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

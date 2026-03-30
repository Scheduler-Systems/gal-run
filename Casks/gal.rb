cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.427"
  sha256 arm:    "e85401564ed28708a862c866f993696e50ea866812c3442bc629898a83f85a26",
         x86_64: "dde5cbd2f96d7c56baf5ddaf070d14056e993f462fbc1472f1d5cfc43c9735c9"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.427/gal-#{version}-darwin-#{arch}.tar.gz"
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

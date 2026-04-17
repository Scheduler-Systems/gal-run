cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.594"
  sha256 arm:    "37af70b82f6e4ad61b07b66327e5092974a3c9f183051c27d0aea63b59637229",
         x86_64: "94b7b5d643c12361ab2909368e50f2c6cb26270ab7a4f861dd0232be81c9051d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.594/gal-#{version}-darwin-#{arch}.tar.gz"
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

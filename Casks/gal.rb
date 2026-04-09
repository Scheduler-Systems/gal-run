cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.556"
  sha256 arm:    "b12bd215ab39c5a2ec1d601881c803e562d3b07f0518b62c45097125b89fadba",
         x86_64: "8aa1a35504db08a8c5a246d2063ed695685151579c622ef36977e702ac0dc0a4"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.556/gal-#{version}-darwin-#{arch}.tar.gz"
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

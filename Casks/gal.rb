cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.526"
  sha256 arm:    "324c4f890337e547fe2cdcbbf4fd1071c17d75e6c895ba2a738becdec98cb777",
         x86_64: "1bd3489462cc6e77be103c73d6a9fcc8aac41b9b7e6f5d9ff000a1cdd318e743"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.526/gal-#{version}-darwin-#{arch}.tar.gz"
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

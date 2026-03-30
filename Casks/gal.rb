cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.452"
  sha256 arm:    "f1ca0631261f0a65cbcad0e3c7733924fcc868b3f014e576ba3d8c3b757413d9",
         x86_64: "546a9c80f7aeccd32ebd44602d80aba025271c8bd34f1985df7aea06f0a1624c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.452/gal-#{version}-darwin-#{arch}.tar.gz"
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

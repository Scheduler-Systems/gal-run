cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.346"
  sha256 arm:    "4d9af204ca3aae29bc119fd1b9f6371d533caa33b61c0477104ba7f2e369d6e3",
         x86_64: "b71f93909789dcebbfe13347f9b97c9c9d6cc6bb29d55a728f00b5bfd063ccb6"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.346/gal-#{version}-darwin-#{arch}.tar.gz"
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

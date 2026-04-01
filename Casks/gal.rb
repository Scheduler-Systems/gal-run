cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.520"
  sha256 arm:    "77fa84723bbfebd44dbfad7543e22581f8ad60b3ee83b9cdf5d657aeac56fece",
         x86_64: "c44f59925b5d8d952d027f72455fd3abc12193782f47242de43ab27ad28885c6"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.520/gal-#{version}-darwin-#{arch}.tar.gz"
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

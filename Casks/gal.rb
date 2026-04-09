cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.560"
  sha256 arm:    "9e0237936820a16491df40eb93d826e1098c5c93a69e7747bbb1a59f48b8f1a4",
         x86_64: "01e262ee38ef31d39c93b0091d372c8d09f7c92b175941a02eb44128cacb6062"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.560/gal-#{version}-darwin-#{arch}.tar.gz"
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

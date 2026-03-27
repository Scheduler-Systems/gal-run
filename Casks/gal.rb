cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.367"
  sha256 arm:    "2fc18e8ecad7c55490bac3b0d5e34aab2f516fb83c711c98b8478ef2bded83f6",
         x86_64: "ff4d8ac696d89d75dbf68a6417f67ff10bc9eb95c00b5942b495e4491b4f7341"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.367/gal-#{version}-darwin-#{arch}.tar.gz"
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

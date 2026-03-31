cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.467"
  sha256 arm:    "03590ea694311effe54c00aa32bc1e2834b4557aeb130668ceb82fd4a60de82c",
         x86_64: "393994d1d7bdd7b0327816bec5514111464d78f1bf7649b7b557b52d6a63e74f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.467/gal-#{version}-darwin-#{arch}.tar.gz"
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

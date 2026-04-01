cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.474"
  sha256 arm:    "8d475cf45c293f3f5a9fee86a65dd53d1ec7e8e8b67f02063180c129e8686576",
         x86_64: "d25254aabeb7782d1c3f2ed090aec597cd427ff331ac8dde57228ee2d17aba52"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.474/gal-#{version}-darwin-#{arch}.tar.gz"
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

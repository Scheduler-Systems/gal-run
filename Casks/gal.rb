cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.463"
  sha256 arm:    "a377cd11fd5dede132bbfb1887a3b82adf379114f196d469cbf5b3f09712e82f",
         x86_64: "c7c2f12cf48ce5b6a9aaae0bcbeb73613557461a7e5ab4fe2c8c4e8972d2c5ed"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.463/gal-#{version}-darwin-#{arch}.tar.gz"
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

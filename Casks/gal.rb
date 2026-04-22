cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.629"
  sha256 arm:    "27bcdb9274c066b93c03a40fe9c051c80c3532d9d268f73badc4cc6b55ee5621",
         x86_64: "bb1dbd8cc4dde05b1f2488b8db32c3e816aac5153efed5e01ae347f42d5bb461"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.629/gal-#{version}-darwin-#{arch}.tar.gz"
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

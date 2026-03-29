cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.405"
  sha256 arm:    "2bd449ab6bcfe06f305a66ebd8170efa2b1dccf31cde8a469c25d397b6ab5ed3",
         x86_64: "f221548aaa8143813e188c661e8fb37e02e9b351496b8e7c7988877161f1f620"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.405/gal-#{version}-darwin-#{arch}.tar.gz"
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

cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.483"
  sha256 arm:    "6b3255612c5d0146582dea682a174e840a3727e88f9f738ff1802b4597c75be1",
         x86_64: "2d9a62384c3441ff0275b9d7af38c45596fd82288553f3602483410dcee8f1d2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.483/gal-#{version}-darwin-#{arch}.tar.gz"
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

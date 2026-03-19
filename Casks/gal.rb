cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.307"
  sha256 arm:    "bb151872638f51c14850dc2b6d93ee6b60c84a0b67374181e61a79c82ce1e149",
         x86_64: "29d281bd18d7c9d9234905e3768be8c159305ad1be5ea8e3660d9d843023372e"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.307/gal-#{version}-darwin-#{arch}.tar.gz"
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

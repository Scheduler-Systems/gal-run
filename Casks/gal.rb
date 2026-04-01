cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.507"
  sha256 arm:    "827cde082520bc1fc62d30c36eb830984e7df12a71d8743540eb9fb1a2b9e26b",
         x86_64: "3cef5a428b51f385ba92995040d02f3dadd8a2613bbb9c775dcba40639dbb3e6"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.507/gal-#{version}-darwin-#{arch}.tar.gz"
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

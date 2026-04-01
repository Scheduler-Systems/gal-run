cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.508"
  sha256 arm:    "9bf5290fc6101fb5e627270ec535c130e0bf51de5d15b421a0c81b84d4d4f9e6",
         x86_64: "6ffb24256f4e078ce6f65fcd500890ceb0c69b5de5ad66e85e8d05211e26afc4"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.508/gal-#{version}-darwin-#{arch}.tar.gz"
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

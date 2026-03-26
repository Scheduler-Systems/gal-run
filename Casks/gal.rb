cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.364"
  sha256 arm:    "b6f036013315286b1d2b2e8e61919fd6077deeca25af64d057ac2084e5fc04da",
         x86_64: "b72cda8c4f70f9943668ded39e39f148c155f7a0e621daa46f9230015dc60ad4"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.364/gal-#{version}-darwin-#{arch}.tar.gz"
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

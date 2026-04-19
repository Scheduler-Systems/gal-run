cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.605"
  sha256 arm:    "1f1528b6b35e79d93c9d815a1c14d2531a4b45bf2ee6e9180be700831b456d37",
         x86_64: "24285e9dddd2200b77ff9c4ad7584b40bbbc3b66b6560330d3a0d4a935d4d49f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.605/gal-#{version}-darwin-#{arch}.tar.gz"
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

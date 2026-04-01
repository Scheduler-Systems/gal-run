cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.485"
  sha256 arm:    "1761d9aa21737f9e9188f83fd128ec210fe2b9cb43b485522ceb01ad26ee9fd7",
         x86_64: "685e8351d376279c3036f467a05ffb5ad7cebed5691eb5a54c09e58ef11c8e88"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.485/gal-#{version}-darwin-#{arch}.tar.gz"
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

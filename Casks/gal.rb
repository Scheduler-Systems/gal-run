cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.486"
  sha256 arm:    "a63597d6798b416433b07d07ac5309e1886227cd53189cfa79dd8ec052b8fc18",
         x86_64: "bb595b1348061c2b85071d1b48f7ff7f7ec1e757957b1fdca919fb3d84bcc8d3"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.486/gal-#{version}-darwin-#{arch}.tar.gz"
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

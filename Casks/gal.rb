cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.460"
  sha256 arm:    "b30f60556339299748f4ab6c0b7682a498a7edea16cf47ad31e02bd999bf2253",
         x86_64: "0393dbda3517d819d3fa36a104543ab936d183766aa9346055efd4f6c6cd1eb7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.460/gal-#{version}-darwin-#{arch}.tar.gz"
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

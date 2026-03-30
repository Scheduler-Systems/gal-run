cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.446"
  sha256 arm:    "cd0359d7a6f66ad3cc0423130ce79a36bca872c4ab7b68fa546c9fd300fdc4f1",
         x86_64: "5f0e41a04921e8163a7085f0e189d2b50042eccb258eccf5b5740107e82f8d10"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.446/gal-#{version}-darwin-#{arch}.tar.gz"
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

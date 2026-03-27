cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.381"
  sha256 arm:    "f70c64d2fc70b6728f4d36d2185b2ebfd66f92f9fe5dc3cc427d31ba04b4015e",
         x86_64: "8bb72bebdc2337a505c269723772bd221d4d90c8ec8adf9c552f1c36af857c77"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.381/gal-#{version}-darwin-#{arch}.tar.gz"
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

cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.374"
  sha256 arm:    "d030e8e5355d90a74223804d97a6a6f9231ff2347ec72b69b1635191772d1d8a",
         x86_64: "94ef4a9187765ccddf5714f0f2c0b884d293578b44fd60bb569e2ad3efbc731d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.374/gal-#{version}-darwin-#{arch}.tar.gz"
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

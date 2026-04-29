cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.660"
  sha256 arm:    "6eb3ebc4c24076a8de41023d7337db5ee8a3fcc7074c58315d4d4f2e1af74b20",
         x86_64: "cb3d7155431bee3e5982867176443877f4096fb097e22d2bf263d82ac084a299"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.660/gal-#{version}-darwin-#{arch}.tar.gz"
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

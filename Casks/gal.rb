cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.370"
  sha256 arm:    "7e67b0a83893203bb36902a1449caf93259d5f9a733b64b0f0b24a01a30179ce",
         x86_64: "8d736d27f9db7c0a999f2c93517dee67dce3d7c3e3ec9a64af713fcc1cb79b39"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.370/gal-#{version}-darwin-#{arch}.tar.gz"
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

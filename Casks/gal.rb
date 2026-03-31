cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.471"
  sha256 arm:    "92d641f96d6ae5f60dfa986d2045cf02b02f69db0b9fd6c0878883f5a671e8a8",
         x86_64: "ad0a4f99985e69ebabaca7a58b4a97c449ce90e10464c1fe5be7d95db1b5c93d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.471/gal-#{version}-darwin-#{arch}.tar.gz"
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

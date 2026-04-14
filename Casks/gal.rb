cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.590"
  sha256 arm:    "978cadcf9ec465c2f0894a05f5bfe21f65a74681fddc554aa4c27a5a6cdaa698",
         x86_64: "074da4ac412d8f8f2dae1f7cdaa6f5fc28f7915abb3182664158c8d853117b7d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.590/gal-#{version}-darwin-#{arch}.tar.gz"
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

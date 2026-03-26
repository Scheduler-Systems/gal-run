cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.361"
  sha256 arm:    "ce2a78a32693d913e3d63b2d7ee79ad3a8b89377426aff61e52bf78cab094266",
         x86_64: "d5f814c2205f24b7bf474c112dc75f0f34ad2a76c9f5519b5ee1910bfb4ab55a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.361/gal-#{version}-darwin-#{arch}.tar.gz"
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

cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.624"
  sha256 arm:    "991e3d42cda3c0c18468434491b3dc72e8bb3a33624a4e2adb11c8bccc87d329",
         x86_64: "89e9fefafb0ed5f62344d9eba35563709fda2b648572d8b6d9ba16b4a51cb202"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.624/gal-#{version}-darwin-#{arch}.tar.gz"
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

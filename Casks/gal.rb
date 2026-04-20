cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.607"
  sha256 arm:    "0832422155abad23c0eda8bfe345447aab8e9f7f168a67d406f9cad506c887ee",
         x86_64: "5c64875a0a8b423163600b84e5558f2963565f3872fa832220165f911b207b70"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.607/gal-#{version}-darwin-#{arch}.tar.gz"
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

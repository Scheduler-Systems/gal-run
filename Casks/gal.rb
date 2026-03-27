cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.384"
  sha256 arm:    "fe8321a262b5ccd85f44f18096e9bbf2aabec7ad66ae2d3e5a86626a50ec0ff2",
         x86_64: "e318699ee71084befb6a2499f6171c5314a224a90aae8aaeda8abb2fb09acc6a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.384/gal-#{version}-darwin-#{arch}.tar.gz"
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

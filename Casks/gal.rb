cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.453"
  sha256 arm:    "0339814a4b2534bfa53c7ccf2a28d8f073353a686232b68432de5b3a5f5e2728",
         x86_64: "863c5267ee71013f99d9307583070e789eb61217cbcf85c7e16f60ab9dd4b1c0"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.453/gal-#{version}-darwin-#{arch}.tar.gz"
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

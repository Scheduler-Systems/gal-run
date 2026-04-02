cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.534"
  sha256 arm:    "96eae70ae1a66464db556c624a73d6bf81efcc1e05c00c71eef08566b050da98",
         x86_64: "4a3b0f9e54d7de25c91a5f079fa737b9e82602a61c18b1e61eca6a0006f09944"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.534/gal-#{version}-darwin-#{arch}.tar.gz"
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

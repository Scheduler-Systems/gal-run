cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.515"
  sha256 arm:    "009f21d8033620e402fd5476f6c4469ce46cc843ec80cc9657b96e9ce183d59a",
         x86_64: "48325c420f2686fd358ff03051e4b55a7558557dcdaa93511781c27dcbe3a8d7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.515/gal-#{version}-darwin-#{arch}.tar.gz"
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

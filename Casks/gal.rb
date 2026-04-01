cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.518"
  sha256 arm:    "94d40b215049726e34b855e74038c8ae4e7dd94364454069640c5626b306da26",
         x86_64: "684a8f81841d1a8d9fa9bca0414914b7b93f2ad97c1fc09d32ab687de2b5117d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.518/gal-#{version}-darwin-#{arch}.tar.gz"
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

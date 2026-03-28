cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.396"
  sha256 arm:    "17f97b0f15559aaeabbe5f93741b42af10df6f5c6dc8b5bb32cc32862a6f74a7",
         x86_64: "3081ba5fe806bb3e703120043d7fe4e94f2b103fa8a04f25714592e1b5079d3b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.396/gal-#{version}-darwin-#{arch}.tar.gz"
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

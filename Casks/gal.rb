cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.503"
  sha256 arm:    "15e5be145fb6793b2631e27751832f52730f424cc66f369d9fceb277f1fd471d",
         x86_64: "614e2048d8e2b94f4faede4bd0275375d61bf290bbd86773a899f3fa54de64c0"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.503/gal-#{version}-darwin-#{arch}.tar.gz"
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

cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.309"
  sha256 arm:    "59e8190ae3d08e482d36cb7fdd058dbc10650073718fc1722457f93fe47cfff2",
         x86_64: "9df85c0dab09726aa0316f05018f637d2317da19a082e3591d098436ed9baf50"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.309/gal-#{version}-darwin-#{arch}.tar.gz"
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

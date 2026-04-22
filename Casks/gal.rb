cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.630"
  sha256 arm:    "943fbea54b44c83a981e36bbdf3f9d43f3172db80c35e1c58cd7ad83d51b8fc2",
         x86_64: "fb98332632157a279a16b75c39f1e40e193e4ddd9f58719648eedd635a842ca4"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.630/gal-#{version}-darwin-#{arch}.tar.gz"
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

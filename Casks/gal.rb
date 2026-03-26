cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.353"
  sha256 arm:    "86cf056de205c8d196e72cda0411bf74e29eb77ab4b350bc67840bd0950dca55",
         x86_64: "8e946f9e4fd6593d60bd7eec5fbc98a9e6ca477f9665d4593c71165ce2f67963"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.353/gal-#{version}-darwin-#{arch}.tar.gz"
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

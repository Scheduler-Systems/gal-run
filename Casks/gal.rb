cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.443"
  sha256 arm:    "e03e3fcda3aa892144c6a54ceb35e65122c685ebfa0d41d7468d072b51df0596",
         x86_64: "c4db9f1bca1088ea405b705497e4d78e7e3e425784d8d4e30a3b07414e02b5cb"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.443/gal-#{version}-darwin-#{arch}.tar.gz"
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

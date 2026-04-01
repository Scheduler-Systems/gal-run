cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.491"
  sha256 arm:    "0f8ad39e53437b790cabe932d24d70142eff31056e9d9f2a5f3945c74218385a",
         x86_64: "8450f4155233f627891520ce0c5c9bd80811bdf44ad1943a53000980652456f1"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.491/gal-#{version}-darwin-#{arch}.tar.gz"
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

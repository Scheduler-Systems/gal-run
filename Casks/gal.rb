cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.447"
  sha256 arm:    "79a7f30a192399dbde55268ef279bfa5013f81d19d7b27d54be50fddd6fcf89e",
         x86_64: "38c27f342caf24a8a1fa7502c885b5bbed03f7a980faf1ea0333350e58cddcc2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.447/gal-#{version}-darwin-#{arch}.tar.gz"
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

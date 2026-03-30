cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.441"
  sha256 arm:    "e249e8d146ad09a22a70cf1d0057bcacaf3b27948ca34ba8af0d4c0ff20b72e3",
         x86_64: "40cb0ca4fa889701bb563814b357861eb55b5d9a5f5314e69d244f9604242903"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.441/gal-#{version}-darwin-#{arch}.tar.gz"
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

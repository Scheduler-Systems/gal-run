cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.369"
  sha256 arm:    "dd5d4effbb3e15368677c9035b3b92b3f3da6d0e21bd91a37ef74f82b2a46d89",
         x86_64: "225661b770d69235a086dc264d1be005eddff4892aef9cc17eb3ef2c1d42ac98"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.369/gal-#{version}-darwin-#{arch}.tar.gz"
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

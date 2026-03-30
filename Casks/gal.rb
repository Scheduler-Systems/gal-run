cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.454"
  sha256 arm:    "c5e73e9f53006425effa028d4700b1296743fdff00ee968c20515e0caff3b116",
         x86_64: "06095c6c3a87d6092b436747a03283b48bfee33c2afc8b9da20755ca53d85db2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.454/gal-#{version}-darwin-#{arch}.tar.gz"
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

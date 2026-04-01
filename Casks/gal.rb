cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.480"
  sha256 arm:    "d551e1cdac6cfcca4e12e89a31ae455f5effc66419607f8a32812c1a142c33d1",
         x86_64: "18b420650845e61c6129a29819832363b5b048bd692335cbc34f07007d8da494"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.480/gal-#{version}-darwin-#{arch}.tar.gz"
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

cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.394"
  sha256 arm:    "cd356fb64e81331c2dd4d6f3346d969acf4ccabd55386e2f7a17fcf8535704d1",
         x86_64: "8bfa667c5c993e1068f77007a47f35b871a0c2411a9fccd889549b76e00b7a0f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.394/gal-#{version}-darwin-#{arch}.tar.gz"
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

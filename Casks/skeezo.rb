cask "skeezo" do
  version "0.1.6"
  sha256 "06178b271ba01a830166842ac6c1992e5d725af3a1fdc3c025fbd329ccc3257c"

  url "https://dl.skeezo.dev/releases/#{version}/Skeezo.dmg",
      verified: "dl.skeezo.dev/"
  name "Skeezo"
  desc "Agent-native IDE that drives your installed Claude Code CLI"
  homepage "https://skeezo.dev/"

  livecheck do
    url "https://api.skeezo.dev/v1/updates/latest?target=darwin&arch=aarch64&current=0.0.0&channel=stable"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  # Bare symbol is cask's minimum-version form (tauri.conf.json pins 11.0).
  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Skeezo.app"

  # Settings → About can install a /usr/local/bin/skeezo shim with an admin
  # prompt; it's left alone here since removing it needs the same privileges.
  zap trash: [
    "~/Library/Application Support/dev.skeezo",
    "~/Library/Caches/dev.skeezo",
    "~/Library/Saved Application State/dev.skeezo.savedState",
    "~/Library/WebKit/dev.skeezo",
  ]
end

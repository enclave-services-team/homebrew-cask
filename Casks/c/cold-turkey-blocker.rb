cask "cold-turkey-blocker" do
  version "4.5"
  sha256 :no_check

  url "https://getcoldturkey.com/files/Cold_Turkey_Mac_Installer.pkg"
  name "Cold Turkey"
  desc "Block websites, games and applications"
  homepage "https://getcoldturkey.com/"

  # The `href` attribute of the download link is set dynamically using inline JavaScript.
  # The `v` parameter is used for cache busting and does not affect the returned data.
  livecheck do
    url "https://getcoldturkey.com/news/"
    regex(/Cold[._-]Turkey[._-]Mac[._-]Installer\.pkg\?v=(\d+(?:\.\d+)+)/i)
  end

  pkg "Cold_Turkey_Mac_Installer.pkg"

  uninstall launchctl: [
              "launchkeep.cold-turkey",
              "launchkeep.cold-turkey-all-users",
            ],
            pkgutil:   [
              "com.getcoldturkey.blocker-chrome-ext",
              "com.getcoldturkey.blocker-edge-ext",
              "com.getcoldturkey.blocker-firefox-ext",
              "com.getcoldturkey.coldturkeyblocker",
            ]

  zap trash: [
    "~/Library/Application Scripts/com.getcoldturkey.blocker-shared-data",
    "~/Library/Caches/com.getcoldturkey.blocker",
    "~/Library/Group Containers/com.getcoldturkey.blocker-shared-data",
    "~/Library/HTTPStorages/com.getcoldturkey.blocker",
    "~/Library/Preferences/com.getcoldturkey.blocker.plist",
    "~/Library/WebKit/com.getcoldturkey.blocker",
  ]
end

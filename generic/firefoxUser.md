# Firefox Hardening Config

## about:preferences#privacy

✅ Disable everything here:

❌ Firefox Suggest  
❌ Telemetry  
❌ Crash Reports  
❌ Studies  
❌ Pocket Recommendations

## about:config

| Setting                            | Value | Description                                            |
| ---------------------------------- | ----- | ------------------------------------------------------ |
| privacy.resistFingerprinting       | true  | Blocks fingerprinting scripts (100x better than Brave) |
| privacy.trackingprotection.enabled | false | Blocks trackers, but can break vids                    |
| network.cookie.cookieBehavior      | 5     | Blocks third-party cookies                             |
| privacy.firstparty.isolate         | false | Stops cross-site tracking                              |
| geo.enabled                        | false | Blocks location tracking                               |
| webgl.disabled                     | false | Stops GPU fingerprinting                               |
| media.peerconnection.enabled       | true  | Disables WebRTC (leaks your IP even with a VPN)        |
| browser.safebrowsing.enabled       | false | Stops Google Safe Browsing from phoning home           |
| dom.battery.enabled                | false | Stops sites from tracking your battery level           |

### Disable Safe Browsing

| Setting                                         | Value   | Description                                               |
| ----------------------------------------------- | ------- | --------------------------------------------------------- |
| browser.safebrowsing.enabled                    | false   | Stops Google Safe Browsing from phoning home              |
| browser.safebrowsing.downloads.remote.enabled   | false   | Blocks Google from scanning downloads                     |
| browser.safebrowsing.downloads.enabled          | false   | Stops download reputation checks                          |
| browser.safebrowsing.malware.enabled            | false   | Blocks Firefox from asking Google if sites are "malware"  |
| browser.safebrowsing.phishing.enabled           | false   | Blocks Firefox from asking Google if sites are "phishing" |
| browser.safebrowsing.provider.google.updateURL  | (empty) | Nukes all Google Safe Browsing connections                |
| browser.safebrowsing.provider.google4.updateURL | (empty) | Nukes v4 Google Safe Browsing API                         |
| browser.safebrowsing.provider.mozilla.updateURL | (empty) | Stops Mozilla from phoning home                           |

## Extensions

-   ublock origin (also enable cookie easyList)
-   Dark reader
-   Privacy Badger

## Hardening options

Those could make some things, like videos and so on to stop working

| Setting                            | Value | Description                                     |
| ---------------------------------- | ----- | ----------------------------------------------- |
| privacy.trackingprotection.enabled | true  | Blocks trackers, but can break vids             |
| privacy.firstparty.isolate         | true  | Stops cross-site tracking                       |
| webgl.disabled                     | true  | Stops GPU fingerprinting                        |
| media.peerconnection.enabled       | false | Disables WebRTC (leaks your IP even with a VPN) |

network.http.referer.XOriginPolicy → 2 (Blocks sites from seeing where you came from) at 0 by default

## Match Safari Security features

In Firefox → Settings → Privacy & Security:
✅ Enable "HTTPS-Only Mode" (Forces all sites to use encryption)
✅ Set "Enhanced Tracking Protection" to "Strict" (Blocks more trackers & scripts)
✅ Disable "Allow Firefox to install and run studies" (Prevents unwanted experiments)
✅ Disable "Telemetry" (Firefox data collection)

✅ Go to Firefox Settings → Privacy & Security
✅ Enable "Block dangerous and deceptive content"

### about:config

browser.download.manager.scanWhenDone → true (Scans downloads for malware like Safari does)
browser.safebrowsing.downloads.remote.enabled → false (Prevents Mozilla from tracking downloads)

browser.tabs.remote.autostart → true (Ensures each tab runs in a separate process)
fission.autostart → true (Full Site Isolation — Makes Firefox match Safari’s process separation! 🚀)

🚫 Disable Dangerous Features (Prevent Code Injection & XSS)

javascript.options.baselinejit → false (Prevents JIT exploitation, but slows JavaScript slightly)
javascript.options.ion → false (Disables a part of JavaScript that hackers sometimes exploit)
dom.event.clipboardevents.enabled → false (Stops sites from tracking copy/paste actions)

🔐 Enable Strong Security Protections (Match Safari’s Sandboxing)

security.tls.enable_0rtt_data → false (Prevents session hijacking attacks)

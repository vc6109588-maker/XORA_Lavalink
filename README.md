🎵 XORA Lavalink

A Powerful Lavalink v4 Music Node for Discord Music Bots

XORA Lavalink is a self-hosted Lavalink server powered by Lavalink v4 and multiple audio plugins. It is designed to provide music playback support for Discord bots using YouTube, Spotify integration, SoundCloud and other supported audio sources.

✨ Features

- Lavalink v4.2.1
- YouTube Plugin 1.18.2
- LavaSrc Plugin 4.8.3
- LavaSearch Plugin 1.0.0
- YouTube search and direct track loading
- YouTube OAuth authentication support
- Spotify track, album and playlist integration through LavaSrc
- SoundCloud support
- Bandcamp support
- Twitch support
- Vimeo support
- Niconico support
- HTTP audio URL support
- Multiple audio filters
- Docker-based deployment
- Render hosting support
- Environment variable-based credential configuration

📦 Installed Plugins

Plugin| Version| Purpose
Lavalink| 4.2.1| Main audio server
YouTube Plugin| 1.18.2| YouTube search and playback
LavaSrc| 4.8.3| Spotify and additional source integrations
LavaSearch| 1.0.0| Additional search functionality

🎧 Supported Audio Sources

The following sources are configured in XORA Lavalink:

Audio Source| Status
YouTube| Enabled
Spotify| Enabled through LavaSrc
SoundCloud| Enabled
Bandcamp| Enabled
HTTP Audio URLs| Enabled
Twitch| Enabled
Vimeo| Enabled
Niconico| Enabled
Apple Music| Disabled
Deezer| Disabled
Yandex Music| Disabled
Local Files| Disabled
Flowery TTS| Disabled

Important: Spotify integration uses LavaSrc to retrieve track information and find playable audio through configured providers. It does not provide native Spotify audio streaming.

Source availability depends on the provider, plugin support, track restrictions and authentication requirements. Enabled does not mean every track is guaranteed to play.

🎚️ Supported Audio Filters

XORA Lavalink has the following filters enabled:

- Channel Mix
- Distortion
- Equalizer
- Karaoke
- Low Pass
- Rotation
- Timescale
- Tremolo
- Vibrato
- Volume

These filters can be controlled by compatible Discord music bots.

---

🚀 Hosting Guide (Render)

Follow these steps to host XORA Lavalink on Render.

Step 1 — GitHub Repository

1. Create a new GitHub repository.
2. Upload the project files.
3. Make sure the repository contains the following structure:

XORA-Lavalink/
├── Dockerfile
├── .dockerignore
├── application.yml
├── README.md
└── plugins/
    ├── lavasearch-plugin-1.0.0.jar
    ├── lavasrc-plugin-4.8.3.jar
    └── youtube-plugin-1.18.2.jar

Step 2 — Create a Render Service

1. Visit https://render.com/
2. Sign in or create an account.
3. Open the Render Dashboard.
4. Click New +.
5. Select Web Service.
6. Connect your GitHub account.
7. Select your XORA Lavalink repository.
8. Choose Docker as the runtime.
9. Create the service and start deployment.

Wait until the Docker build and Lavalink startup are completed.

Step 3 — Add the Four Required Environment Variables

IMPORTANT: After creating your Render service, you MUST add these four Environment Variables separately.

Go to:

Render Dashboard → Your Web Service → Environment → Add Environment Variable

Add all four variables using the exact names below.

Variable Name| Required Value
"LAVALINK_SERVER_PASSWORD"| Your own strong Lavalink password
"SPOTIFY_CLIENT_ID"| Your Spotify Developer Client ID
"SPOTIFY_CLIENT_SECRET"| Your Spotify Developer Client Secret
"YOUTUBE_REFRESH_TOKEN"| Your YouTube OAuth Refresh Token

1. LAVALINK_SERVER_PASSWORD

Create a strong password of your choice.

This password protects your Lavalink server API.

You must use the same password in your Discord bot's Lavalink node configuration.

2. SPOTIFY_CLIENT_ID

To obtain your Spotify Client ID:

1. Visit https://developer.spotify.com/dashboard/
2. Sign in to your Spotify Developer account.
3. Create a Spotify application.
4. Open the application settings.
5. Copy the Client ID.
6. Add it to Render as "SPOTIFY_CLIENT_ID".

3. SPOTIFY_CLIENT_SECRET

In the same Spotify application:

1. Open the application settings.
2. Find your Client Secret.
3. Copy it.
4. Add it to Render as "SPOTIFY_CLIENT_SECRET".

Keep your Spotify Client Secret private. Never upload it to GitHub.

4. YOUTUBE_REFRESH_TOKEN

The YouTube Refresh Token is used by the YouTube Plugin for OAuth authentication.

To obtain it:

1. Use a separate Google account if possible.
2. Follow the official YouTube Plugin OAuth instructions.
3. Complete the Google authorization process.
4. Obtain the generated refresh token.
5. Add it to Render as "YOUTUBE_REFRESH_TOKEN".

Official YouTube Plugin documentation:

https://github.com/lavalink-devs/youtube-source

Important: A YouTube Refresh Token is not a YouTube API Key. It is generated through the plugin's OAuth authorization process.

After adding all four variables, save the changes and redeploy your Render service.

---

🤖 Connecting XORA Lavalink to a Discord Bot

After successful hosting, use your Render service URL to connect a compatible Discord music bot.

Example node configuration:

nodes: [
  {
    name: "XORA Lavalink",
    url: "YOUR-SERVICE-NAME.onrender.com:443",
    auth: "YOUR_LAVALINK_SERVER_PASSWORD",
    secure: true
  }
]

Replace:

- "YOUR-SERVICE-NAME.onrender.com" with your actual Render hostname.
- "YOUR_LAVALINK_SERVER_PASSWORD" with the exact value of your "LAVALINK_SERVER_PASSWORD" environment variable.

Make sure your Discord bot supports Lavalink v4.

---

🧪 Testing the Lavalink Server

After deployment, you can test the server using Termux, Linux or another terminal.

Check Server Information

curl -H "Authorization: YOUR_LAVALINK_SERVER_PASSWORD" \
https://YOUR-SERVICE-NAME.onrender.com/v4/info

A successful response should show Lavalink version information, plugins, source managers and supported filters.

Test YouTube Search

curl -G \
-H "Authorization: YOUR_LAVALINK_SERVER_PASSWORD" \
--data-urlencode "identifier=ytsearch:Arijit Singh songs" \
https://YOUR-SERVICE-NAME.onrender.com/v4/loadtracks

A successful search should return track information.

Test a Direct YouTube URL

curl -G \
-H "Authorization: YOUR_LAVALINK_SERVER_PASSWORD" \
--data-urlencode "identifier=https://www.youtube.com/watch?v=dQw4w9WgXcQ" \
https://YOUR-SERVICE-NAME.onrender.com/v4/loadtracks

A successful response should contain a loaded track.

Note: Successful track loading does not automatically guarantee Discord voice playback. Actual playback also depends on the bot, voice connection and audio stream availability.

---

⚠️ Important Notes & Troubleshooting

YouTube Video Requires Login

Some YouTube videos require account authentication or have additional restrictions.

Such videos may fail even when YouTube OAuth is configured correctly.

Spotify Tracks Not Playing

Check the following:

- Spotify Client ID is correct.
- Spotify Client Secret is correct.
- Both Spotify environment variables are added to Render.
- LavaSrc plugin loaded successfully.
- A playable matching audio source is available.

Bot Cannot Connect to Lavalink

Verify:

- Render service is running.
- Correct Render hostname is configured.
- Port is "443".
- Secure connection is "true".
- Bot password matches "LAVALINK_SERVER_PASSWORD".

Render Service Sleeps

Depending on the Render hosting plan, inactive services may sleep or become temporarily unavailable.

Security

- Never publish your Lavalink password.
- Never publish your Spotify Client Secret.
- Never publish your YouTube Refresh Token.
- Store all private credentials in Render Environment Variables.
- Do not commit secret values to GitHub.
- Rotate any credentials that have been exposed.

---

📚 Official Documentation

- Lavalink: https://github.com/lavalink-devs/Lavalink
- YouTube Plugin: https://github.com/lavalink-devs/youtube-source
- LavaSrc: https://github.com/topi314/LavaSrc
- LavaSearch: https://github.com/topi314/LavaSearch
- Render: https://render.com/docs
- Spotify Developer Dashboard: https://developer.spotify.com/dashboard/

---

❤️ About XORA Lavalink

XORA Lavalink is built using Lavalink and open-source plugins to provide a music backend for compatible Discord music bots.

Project: XORA Lavalink
Server: Lavalink v4
Deployment: Docker / Render
Purpose: Discord Music Streaming Backend

Thank you for using XORA Lavalink!

Keep the music playing! 🎶

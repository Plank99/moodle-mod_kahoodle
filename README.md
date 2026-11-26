[![MDL Shield](https://img.shields.io/endpoint?url=https%3A%2F%2Fmdlshield.com%2Fapi%2Fbadge%2Fmod_kahoodle)](https://mdlshield.com/plugins/mod_kahoodle)

# Kahoodle - Real-time Quiz Activity for Moodle

Kahoodle is a Moodle activity module that enables real-time, interactive quiz sessions where all participants take a quiz simultaneously. Designed for engaging, game-like quiz experiences similar to popular classroom quiz platforms.

Find out more on the [product page](https://lmscloud.io/plugins/mod_kahoodle) on LMSCloud.

## About this fork

This is a fork of `mod_kahoodle`. It follows upstream
[`v4.5.2`](https://github.com/marinaglancy/moodle-mod_kahoodle) and adds one
thing: **a question may have more than one correct answer.**

- The facilitator marks every correct option with `*` when writing the question.
- Participants toggle their choices and send them with a confirm button, instead
  of the answer being submitted on the first tap.
- Credit is all or nothing: the selected set has to match the correct set
  exactly, so a partial answer scores zero.
- Single-answer questions behave exactly as upstream — the confirm button only
  appears when a question actually has several correct options.

The fork's code is on **`main`**, released as `4.5.2+multi.1`; the
`multi-correct` branch points at the same commit and is kept as the feature
branch. Upstream is tracked through the `upstream` remote, and new upstream
releases are merged in here. Everything else — gameplay, scoring,
leaderboard, backup, privacy — is upstream's.

## Features

- **Real-time gameplay** - All participants answer questions simultaneously
- **Live leaderboard** - Points based on correctness and response speed
- **Multiple rounds** - Run multiple quiz sessions with the same questions
- **Identity modes** - Participants can use real names, nicknames with avatars, or stay anonymous
- **Question versioning** - Edit questions while preserving historical round data
- **Mobile-friendly** - Responsive design for participant devices

## Screenshots

<p align="center">
<a href="https://lmscloud.io/plugins/mod_kahoodle" target="_blank" style="margin:0 10px"><img src="https://lmscloud.io/images/mod_kahoodle/1.png" alt="Facilitator Lobby" width="300"></a> <a href="https://lmscloud.io/plugins/mod_kahoodle" target="_blank" style="margin:0 10px"><img src="https://lmscloud.io/images/mod_kahoodle/3.png" alt="Participant Question" width="300"></a>
<br>
More screenshots on the <a href="https://lmscloud.io/plugins/mod_kahoodle" target="_blank">product page</a>.
</p>

## Requirements

- Moodle 4.5 or higher
- [tool_realtime](https://github.com/marinaglancy/moodle-tool_realtime) plugin for real-time communication using PHP polling or websockets.

## Usage

1. Add a Kahoodle activity to your course
2. Create questions in the Questions tab
3. Start a round and share your screen with participants (the lobby displays a QR code with the activity link)
5. Participants join with a display name and avatar
4. Questions advance automatically, or you can pause and advance manually

## Installation

1. Download the plugin
2. Extract to your Moodle installation:
   - Moodle 4.5 and 5.0: `mod/kahoodle/`
   - Moodle 5.1 and above: `public/mod/kahoodle/`
3. Visit Site administration > Notifications to complete installation

## Additional Features

- **AI-powered content generation**: The plugin provides web services to create instances and add questions. Use with [Moodle MCP](https://lmscloud.io/products/moodle-mcp/) to quickly generate content using your preferred AI agent.
- **WebSocket support**: tool_realtime includes a Centrifugo subplugin for WebSocket-based real-time communication.

## Acknowledgements

This plugin was originally developed during DevCamp at MoodleMoot DACH 2025 by: Marina Glancy, Jan Britz, Immanuel Pasanec, Vasco Grossmann, Lars Dreier, Kathleen Aermes, and Monika Weber.

The code from the DevCamp can be found in the [poc branch](https://github.com/marinaglancy/moodle-mod_kahoodle/tree/poc).

The current version was created with assistance of [Claude Code](https://claude.ai/claude-code) and [Lovable](https://lovable.dev).

## License

GNU GPL v3 or later - https://www.gnu.org/copyleft/gpl.html

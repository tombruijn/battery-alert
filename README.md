# Battery alert

Small tool that keeps an eye on your laptop's battery and gives you a warning when it is full or almost empty. This tool's warnings are meant to tell the user when to disconnect and reconnect to power in order to make the best of the battery life.

The tool will run in the background after starting it (auto start is not available yet) and check the battery life every minute.

The default minimal percentage is `15` and the default maximum percentage is `100`.

## Requirements

- Built for OSX (battery life command)
- Shell
- Growl (for notifications)

## Usage

`sh launch.sh COMMAND`

### Available commands:

- `start`
- `stop`
- `status`

## License

Battery alert released under the MIT License. See the bundled LICENSE file for details.

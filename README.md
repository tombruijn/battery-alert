# Battery alert

Small tool that keeps an eye on your laptop's battery and gives you a warning when it is full or almost empty.
This tool's warnings are meant to tell the user when to disconnect and reconnect to power in order to make the best* of the battery life. (\*read the disclaimer)

The tool will run in the background after starting it (auto start is not available yet) and check the battery life every minute.

The default minimal percentage is `25` and the default maximum percentage is `100`.

## Disclaimer

I'm not saying discharging your laptop's battery every time it's at the maximum (configured) percentage
and charging it again at the minimum (configured) percentage is the best method to preserve battery life.
It's __an__ approach for laptops that are plugged in all the time to take every so often.

As said by [Apple](http://www.apple.com/batteries/notebooks.html): _For proper maintenance of a lithium-based battery, it’s important to keep the electrons in it moving occasionally. Apple does not recommend leaving your portable plugged in all the time. An ideal use would be a commuter who uses her notebook on the train, then plugs it in at the office to charge. This keeps the battery juices flowing. If on the other hand, you use a desktop computer at work, and save a notebook for infrequent travel, Apple recommends charging and discharging its battery at least once per month._

_Personally_, I wrote this tool mainly to get a better hang of bash scripting.
In the real world I'll probably use Battery alert in the weekends, to simulate my commute during the week.
On week days I'll silence Battery alert during work hours most of the time.

## Preview

Preview of notifications (using Growl's _Smoke_ theme).

![Battery alert, battery almost empty](https://raw.github.com/tombruijn/battery-alert/master/doc/preview-empty.png)
![Battery alert, battery (almost) full](https://raw.github.com/tombruijn/battery-alert/master/doc/preview-full.png)
![Battery alert, scheduled alert](https://raw.github.com/tombruijn/battery-alert/master/doc/preview-scheduled.png)

## Requirements

- Built for OSX (battery life command)
- Bash
- Growl (for notifications)

## Installation

```sh
git clone git@github.com:tombruijn/battery-alert.git
cd battery-alert
chmod +x battery-alert main
```

## Usage

`./battery-alert COMMAND`

### Available commands:

- `start` (also acts as restart)
- `stop`
- `status`
- `version`

## Configuration

All options that are configurable are available in the `config.cfg` file.
Such as: minimum and maximum percentage, check up interval, notification rest period and some internally used variables.

_Any change to the `config.cfg` file will require a restart of Battery alert._

### Scheduling

You can a scheduled alerts, something that reminds you to charge your laptop's battery an hour before you have to leave.
Scheduled alerts are based on time, meaning that they will go off every day at that time.

Use the `schedule.csv` file (name configureable in `config.cfg`) to schedule alerts.
Use the following order and format for your schedule file.

```csv
$TIME(%H:%M),$MIN_PERCENTAGE(Integer),"$MESSAGE(String)"
```

Example:

```csv
08:00,10,"Well, you'll never charge me in time for the commute!"
17:00,40,"Almost time to go home dummy! Charge that battery!"
```

_Updating the `schedule.csv` file requires a restart of Battery alert._

## Contributing

If you'd like to help out making Battery alert better you, Thanks! Any help is appreciated.

__Bugs, issues and other__  
Use the [GitHub issue tracker](https://github.com/tombruijn/battery-alert/issues) for this project.
Please add as much information about your issue or the bug you've encountered so it can be quickly reproduced and hopefully resolved.

__Features__  
If you wish to add new features to Battery alert do so by forking the project and submitting a pull request on the project's
[GitHub page](https://github.com/tombruijn/battery-alert).

## To-do list

- Linux support
- Auto start battery alert
- Native OSX notification support

## License

Battery alert released under the MIT License. See the bundled LICENSE file for details.

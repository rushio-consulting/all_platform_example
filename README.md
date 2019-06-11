# All platform example

The repository goal is to provide an example of a cross-platform application (android, ios, linux, macos, windows, web) written in Flutter.

In this example we use API, that are different based on the platform, to save and load the value of the counter.

We use [Mobx.dart](https://pub.dev/packages/mobx) to manage the state of the application.

**WARNING: this is highly experimental and subject to change/bug/crash at every time.**

## How can I launch the application

### 1. Configuring Flutter

You will need to be on the master channel of Flutter

```sh
flutter channel master && flutter upgrade
```

### 2. Settings some env variable

You will need to set some environment variable to allow Flutter access new feature.

For linux :

```sh
export ENABLE_FLUTTER_DESKTOP=true
export FLUTTER_WEB=true
export CHROME_EXECUTABLE="google-chrome"
```

For macos :

```sh
export ENABLE_FLUTTER_DESKTOP=true
export FLUTTER_WEB=true
```


For windows :

TBD

### 3. Launching the application

You can launch the application with F5 on vscode for desktop and mobile.

If you want to test the application on the web you will need to use the command line.

some example:



- Linux
```sh
flutter run -d linux
```

- Web
```sh
flutter run -d web
```

- MacOs


  CocoaPods needs to be installed. It is used to retrieve the iOS and macOS 
  platform side's plugin code that responds to your plugin usage on the Dart side.
  Without CocoaPods, plugins will not work on iOS or macOS.
  For more info, see https://flutter.dev/platform-plugins

    To install CocoaPods:

```sh
brew install cocoapods
pod setup
```
Launch on mac:
    
```sh
flutter run -d macos
```

### 4. Hm there is a bug :/

If you encounter a problem please create an issue [here](https://github.com/rushio-consulting/all_platform_example/issues/new?assignees=&labels=&template=bug_report.md&title=) and we will see what we can do about it.

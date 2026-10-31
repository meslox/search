# Search

A simple command-line search tool written in C++. It allows you to quickly search on **Google** or **YouTube** directly from the terminal.

## Features

- Search Google directly from the terminal
- Search YouTube using the `-y` option
- Automatically opens results in your default web browser
- Works on Linux, macOS, and Windows

## Usage

### Google Search

```bash
search is messi the GOAT
```

Or:

```bash
search -g how to make a website
```

### YouTube Search

```bash
search -y how to learn c++
```

### Help

```bash
search -h
```

## Installation

### Linux

Go to the Linux folder and run:

```bash
chmod +x install.sh
./install.sh
```

After installation, you can use the `search` command from the terminal.

### macOS

Run the `install.command` file from the `mac` folder.

### Windows

Run `install.bat` from the `windows` folder.

After installation, open a new Command Prompt or PowerShell window and use:

```text
search -h
```

## Uninstall

Each platform folder contains an uninstall script:

- Linux: `uninstall.sh`
- macOS: `uninstall.command`
- Windows: `uninstall.bat`

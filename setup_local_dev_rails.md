# `code` Command in Visual Studio Code (VSCode)

In the context of Visual Studio Code (VSCode), the `code` command in the PATH refers to a command-line interface tool provided by VSCode that allows you to open files and folders directly from the command line.

## Adding VSCode to the PATH

When you install VSCode, it typically offers the option to add itself to the system’s PATH environment variable during installation. Adding VSCode to the PATH enables you to open VSCode from any directory in your command line or terminal without needing to provide the full path to the VSCode executable.

## Installing the `code` Command

To install the `code` command, follow these steps:

1. Open VSCode.
2. Press `Cmd+Shift+P` (on macOS) or `Ctrl+Shift+P` (on Windows/Linux) to open the Command Palette.
3. Start typing `Install 'code' command in PATH`.
4. Select the option **"Install 'code' command in PATH"**.

---

# Installing Homebrew

## Homebrew

Homebrew is a package manager for macOS that simplifies the installation of software. Below are the steps to install Homebrew and set it up on your system.

### Step 1: Install Homebrew

In the terminal, run the following command to install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After the initial installation, you will be instructed to run two additional commands in your terminal. 
These commands are specific to your system, so please copy them directly from your terminal.
For example:
```bash
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/dpi-pttl-3/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

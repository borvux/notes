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

---

# Setup a Ruby Version Manager

## Installing rbenv

### Using Homebrew (Recommended)

1. Open your terminal and run the following command to install `rbenv` and `ruby-build`:

   ```bash
   brew install rbenv ruby-build
   ```

2. Load `rbenv` in your shell by running:

   ```bash
   rbenv init
   ```

   Follow the printed instructions to set up `rbenv`.

3. To automatically load `rbenv` in your shell, append the following code to your `~/.zshrc` file:

   ```bash
   eval "$(rbenv init - zsh)"
   ```

   To edit the `~/.zshrc` file in Visual Studio Code, run:

   ```bash
   code ~/.zshrc
   ```

   Paste the code above into the file, save it, and close it.

4. Close your terminal and launch a new one for the changes to take effect.

### Without Homebrew (Using rbenv-installer)

If you aren’t using Homebrew, you can install `rbenv` by running the following command:

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
```

After installation, close your terminal and launch a new one for the changes to take effect.

---

# Choose and Install a Ruby Version

## Determine the Required Ruby Version

## Install a Ruby Version

```bash
rbenv install 3.2.1
```

Once the installation is complete, close your terminal and launch a new one for the changes to take effect.

## Set a Ruby Version

After installing the desired Ruby version, set it as the default or local version:

- **Set the global Ruby version** (default for your machine):
  ```bash
  rbenv global 3.2.1
  ```

- **Set the local Ruby version** (specific to the current directory):
  ```bash
  rbenv local 3.2.1
  ```

## Verify the Ruby Version

To check if the Ruby version was updated successfully, run:

```bash
ruby -v
```

## Install Rails

Once Ruby is installed, you can install Rails by running:

```bash
gem install rails
```

This will download and install the latest version of Rails. After the installation is complete, close your terminal and launch a new one for the changes to take effect.

To verify that Rails is installed, run:

```bash
rails -v
```

---

## Install PostgreSQL

To install PostgreSQL (a popular database used with Rails), use Homebrew:

```bash
brew install postgresql
```

Once the installation is complete, follow the instructions provided by Homebrew to start the PostgreSQL service:

```bash
# To have launchd start postgresql at login:
brew services start postgresql
```

By default, the PostgreSQL user is your current macOS username with no password. For example, if your macOS username is `pttl-42`, you can log in to PostgreSQL with:

```bash
psql pttl-42
```

---

# Setup Version Control with Git and GitHub

## Configure Git

Replace the example name and email address in the following steps with the ones you used for your GitHub account.

1. **Enable colorized output in Git**:
   ```bash
   git config --global color.ui true
   ```

2. **Set your GitHub username**:
   ```bash
   git config --global user.name "YOUR_USERNAME"
   ```
   Replace `"YOUR_USERNAME"` with your GitHub username.

3. **Set your GitHub email**:
   ```bash
   git config --global user.email "YOUR@EMAIL.com"
   ```
   Replace `"YOUR@EMAIL.com"` with the email associated with your GitHub account.

---

## Generate an SSH Key

To securely connect your machine to GitHub, generate an SSH key:

1. Run the following command to create a new SSH key:
   ```bash
   ssh-keygen -t ed25519 -C "YOUR@EMAIL.com"
   ```
   Replace `"YOUR@EMAIL.com"` with the email associated with your GitHub account.

2. When prompted to "Enter a file in which to save the key," press `Enter` to accept the default location.

3. You can optionally add a passphrase for extra security, or press `Enter` to skip.

---

## Add the SSH Key to GitHub

1. Copy the SSH key to your clipboard by running:
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```

2. Log in to your GitHub account and go to **Settings** → **SSH and GPG keys** → **New SSH key**.

3. Give the key a title (e.g., "My Laptop") and paste the copied SSH key into the "Key" field.

4. Click **Add SSH key**.

---

## Verify the SSH Connection

To check if the SSH key was successfully added, run:

```bash
ssh -T git@github.com
```

You should see a message like this:

```
Hi {github username}! You've successfully authenticated, but GitHub does not provide shell access.
```

This confirms that your machine is now connected to GitHub via SSH.

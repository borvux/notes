# VSCode info

## Agenda: tips and tricks for vscode

---

### 1. Initial Setup: Opening Your Codespace

* Let's begin by opening up the Codespace for rails 8 template codespace
* Once it loads, we'll be greeted by the standard Visual Studio Code interface.

### 2. Navigating the VS Code UI

The VS Code interface is primarily divided into three sections.

* **The Left Pane: Explorer** (`⌘ + B`)
    * This is your file and folder navigator. You can toggle it on and off with the shortcut `⌘ + B`.
    * The Explorer view has several tabs on the side (the "Activity Bar"):
        * **Explorer:** Your file tree.
        * **Search:** Global search functionality.
        * **Source Control:** Git integration.
        * **Run and Debug:** For running and debugging your applications.
        * **Extensions:** The marketplace for VS Code extensions.

* **The Top Pane: Code Editor**
    * This is where the magic happens! It's where you'll write and edit your code files.
    * You can have multiple tabs open for different files.

* **The Bottom Pane: The Terminal** (`⌘ + J` or `⌘ + \``)
    * This is a fully functional integrated terminal. You can toggle it with `⌘ + J`.
    * **Pro Tip:** You can open multiple terminal instances! Use the '+' icon or the dropdown menu in the terminal pane to create new terminals. This is great for running a server in one terminal while running Git commands or other scripts in another.

### 3. Finding Your Way: Search

* **Local Search (In-File):** `⌘ + F`
    * Use this to find text *within the currently active file*.

* **Global Search (Project-Wide):** `⌘ + Shift + F`
    * This is incredibly powerful. It searches for text across *every file* in your project folder.
    * The results are displayed in the Search tab in the left-hand sidebar.

### 4. Source Control (Git)

* Source control, also known as version control, is the integrated functionality that allows you to manage and track changes to your codebase directly within VS Code.
* **Integrated Git Support:**
    * VS Code comes with built-in support for Git, the most popular version control system.
    * The Source Control tab (`⌃ + ⇧ + G`) shows you:
        * **Changes:** Files that have been modified.
        * **Staged Changes:** Files you've marked to be included in your next "snapshot" or commit.
    * You can perform common Git operations like staging, committing, pushing, and pulling directly from this UI.

### 5. Productivity Hacks & Essential Shortcuts

#### Workspace Management

* **Split the Screen:** `⌘ + \`
    * This command splits your editor view, allowing you to see two files side-by-side. This is essential for comparing files or referencing one file while working on another.

#### Code Editing Magic

* **Move Code Without Copy/Paste:** `Option + ↑ / ↓`
    * Place your cursor on any line and use this shortcut to move the entire line up or down. Perfect for reordering code blocks quickly.

* **Duplicate Lines:** `Option + Shift + ↑ / ↓`
    * Quickly make a copy of the current line either above or below.

* **Multi-Cursor Editing:** `Option + Click`
    * Hold the `Option` key and click in various places in your file to place multiple cursors. Everything you type will appear in all locations simultaneously. This is a game-changer for repetitive edits.

* **Advanced Cursor Movement:**
    * `⌘ + →`: Move the cursor to the end of the current line.
    * `⌘ + ←`: Move the cursor to the beginning of the current line.
    * **Combine with Shift to Select:**
        * `Shift + ⌘ + →`: Select all text from the cursor to the end of the line.
        * `Shift + ⌘ + ←`: Select all text from the cursor to the beginning of the line.

#### Must-Know Shortcuts Cheat Sheet

| Shortcut | What It Does |
| :--- | :--- |
| `⌘ + S` | Save the current file |
| `⌘ + P` | **Go to File:** Quickly open any file in the project |
| `⌘ + /` | Toggle a comment on the current line(s) |
| `⌘ + Shift + P` | **Command Palette:** Access all VS Code commands |
| `⌘ + B` | Show/hide the Explorer sidebar |
| `⌘ + J` or `⌘ + \`` | Show/hide the integrated terminal |
| `⌘ + Shift + \` | Jump to the matching bracket |
| `⌘ + D` | Select the current word, and each next occurrence |
| `⌘ + K`, then `⌘ + S` | Open the keyboard shortcuts menu (to customize) |
| `⌘ + Shift + E` | Focus the Explorer (sidebar) |

sources
```
https://firstdraft.com/runs/130/lessons/61-vscode-terminal
https://firstdraft.com/runs/130/lessons/50-git-commit-and-push
https://firstdraft.com/runs/130/lessons/31-tips-and-tricks
```
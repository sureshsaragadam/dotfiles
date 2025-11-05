# 🧰 My Dotfiles

Personal Linux configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

## 🌿 Structure

| Package | Linked To | Purpose |
|----------|------------|---------|
| `bash` | `~/.bashrc` | Shell configuration |
| `nvim` | `~/.config/nvim` | Neovim (Kickstart-based) |
| `i3` | `~/.config/i3` | i3 Window Manager |
| `i3blocks` | `~/.config/i3blocks` | Status bar blocks |
| `i3status` | `~/.config/i3status` | i3 bar status config |
| `scripts` | `~/.local/bin` | Personal scripts |

## ⚙️ Setup on a New System

```bash
sudo dnf install stow git -y
git clone https://github.com/sureshsaragadam/dotfiles.git ~/stow/dotfiles
cd ~/stow/dotfiles
stow --restow --target="$HOME" */


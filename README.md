<h1 align="center">
  devsak
  
  🧑‍💻 🇨🇭 🪖 🔪
</h1>
<div align="center">
  <strong>DEV</strong>eloper's <strong>S</strong>wiss <strong>A</strong>rmy <strong>K</strong>nife
  
  ![License](https://img.shields.io/github/license/hristotanev/devsak?color=lightgrey&style=for-the-badge)
  ![Work In Progress](https://img.shields.io/badge/Work%20In%20Progress-orange?style=for-the-badge)
</div>

## Installation
### Arch-based distros
This collection of tools has been packaged inside the AUR and can be easily installed by using your favourite AUR helper (in my case this is [paru](https://github.com/morganamilo/paru)) by running the following command from your terminal:

`paru -S devsak-git`

### Other distros
To install `devsak`, simply run the following command in your terminal:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/hristotanev/devsak/main/scripts/install.sh)"`

## Usage
After successful installation of `devsak`, below is some more information on how it can be used (this is an output of `devsak -h`):
```
Usage: devsak [options] [tool names,...]
Command-line orchestrator for installing different tools.

Some of the available options include:

  -l			 list the names of all available tools
  -a			 install all available tools
  -i tool names,...      install tools specified by their comma separated names
  -h			 display this help and exit
```

## Tools and support
<table>
  <tr>
    <th>Name</th>
    <th>Summary</th>
    <th>OS support</th>
  </tr>
  <tr>
    <td>cheksum</td>
    <td>Verify SHA256 for a file</td>
    <td>Linux</td>
  </tr>
</table>

## Uninstalling devsak
To uninstall `devsak`, just run `uninstall_devsak` from the command-line. It's that easy 🙂.

## Next steps
- [ ] continue adding new tools
- [ ] add a build pipeline for automatic tagging
- [ ] add an automatic package versioning inside AUR for automatic system updates
- [ ] add support for more Linux distros and Mac OS (there will never be any support for Windows 😛)

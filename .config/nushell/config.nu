# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.show_banner = false

$env.PATH = ($env.PATH | prepend "~/.cargo/bin")
$env.PATH = ($env.PATH | prepend "~/.local/bin")

$env.PNPM_HOME = "~/.local/share/pnpm"
$env.PATH = ($env.PATH | split row (char esep) | prepend ($env.PNPM_HOME | path join "bin") )

$env.ZVM_INSTALL = "~/.zvm/self"
$env.PATH = ($env.PATH | prepend "~/.zvm/bin")
$env.PATH = ($env.PATH | prepend $env.ZVM_INSTALL)

$env.NPM_CONFIG_PREFIX = "~/.local/"

source ~/.zoxide.nu
source ./commands/gpkg.nu

fastfetch

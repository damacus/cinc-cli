// This is a separate Go module so the cinc-server-ng test dependency (and its
// SQLite driver) never reaches the root cinc-cli module's dependency graph.
// Only `go test` inside this directory pulls cinc-server-ng. The cinc binary
// under test is still built from the root module (see suite/cli.go), so its
// dependencies are exactly a release build's.
module github.com/cinc-project/cinc-cli/integration

go 1.26.4

require (
	github.com/cinc-project/cinc-api v0.15.1
	github.com/cinc-project/cinc-cli v0.0.0
	github.com/creack/pty v1.1.24
	github.com/spf13/cobra v1.10.2
	golang.org/x/crypto v0.57.0
)

require (
	charm.land/bubbles/v2 v2.2.1 // indirect
	charm.land/bubbletea/v2 v2.1.0 // indirect
	charm.land/lipgloss/v2 v2.0.6 // indirect
	github.com/charmbracelet/ultraviolet v0.0.0-20261008173134-6b8d4baf91b4 // indirect
	github.com/charmbracelet/x/termios v0.1.1 // indirect
	github.com/charmbracelet/x/windows v0.2.2 // indirect
	github.com/kevinburke/ssh_config v1.6.0 // indirect
	golang.org/x/mod v0.41.0 // indirect
	golang.org/x/sync v0.23.0 // indirect
	golang.org/x/tools v0.49.0 // indirect
)

require (
	github.com/BurntSushi/toml v1.6.0 // indirect
	github.com/alecthomas/chroma/v2 v2.27.0 // indirect
	github.com/atotto/clipboard v0.1.4 // indirect
	github.com/charmbracelet/colorprofile v0.4.3 // indirect
	github.com/charmbracelet/x/ansi v0.11.9 // indirect
	github.com/charmbracelet/x/term v0.2.2 // indirect
	github.com/cinc-project/cinc-server-ng v0.14.0
	github.com/cinc-project/cinc-supermarket-api v0.6.0 // indirect
	github.com/clipperhouse/displaywidth v0.11.0 // indirect
	github.com/clipperhouse/uax29/v2 v2.7.0 // indirect
	github.com/dlclark/regexp2/v2 v2.7.1 // indirect
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/lucasb-eyer/go-colorful v1.4.1 // indirect
	github.com/mattn/go-isatty v0.0.24 // indirect
	github.com/mattn/go-runewidth v0.0.30 // indirect
	github.com/muesli/cancelreader v0.2.2 // indirect
	github.com/ncruces/go-strftime v1.0.0 // indirect
	github.com/remyoudompheng/bigfft v0.0.0-20230129092748-24d4a6f8daec // indirect
	github.com/rivo/uniseg v0.4.7 // indirect
	github.com/spf13/pflag v1.0.10 // indirect
	github.com/tetratelabs/wazero v1.12.0 // indirect
	github.com/xo/terminfo v1.0.0 // indirect
	golang.org/x/sys v0.48.0 // indirect
	golang.org/x/term v0.46.0 // indirect
	modernc.org/libc v1.75.7 // indirect
	modernc.org/mathutil v1.7.1 // indirect
	modernc.org/memory v1.12.1 // indirect
	modernc.org/sqlite v1.59.0 // indirect
)

replace github.com/cinc-project/cinc-cli => ../

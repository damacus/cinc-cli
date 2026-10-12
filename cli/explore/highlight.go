package explore

import (
	"os"
	"strings"

	"charm.land/lipgloss/v2/compat"
	"github.com/alecthomas/chroma/v2/formatters"
	"github.com/alecthomas/chroma/v2/lexers"
	chromastyles "github.com/alecthomas/chroma/v2/styles"
	"github.com/charmbracelet/colorprofile"
)

// jsonHighlightStyle is the chroma style used for the JSON detail and summary
// panes. monokai reads well against the dark palette the rest of the TUI uses.
const jsonHighlightStyle = "monokai"

// highlightJSON returns src with terminal syntax highlighting applied, gated
// on enabled. When color is off (pipes, captured test output, NO_COLOR) it
// returns src untouched so the raw text stays clean and copy-pasteable.
func highlightJSON(enabled bool, src string) string {
	if !enabled {
		return src
	}
	return colorizeJSON(src)
}

// colorizeJSON applies chroma JSON highlighting unconditionally. It only ever
// inserts SGR color escapes around the existing tokens, so stripping those
// escapes yields the original text byte-for-byte. On any tokenize/format
// failure it falls back to src so a pane never renders empty.
func colorizeJSON(src string) string {
	lexer := lexers.Get("json")
	if lexer == nil {
		return src
	}
	style := chromastyles.Get(jsonHighlightStyle)
	if style == nil {
		style = chromastyles.Fallback
	}
	formatter := formatters.Get("terminal256")
	if formatter == nil {
		formatter = formatters.Fallback
	}
	it, err := lexer.Tokenise(nil, src)
	if err != nil {
		return src
	}
	var b strings.Builder
	if err := formatter.Format(&b, style, it); err != nil {
		return src
	}
	return b.String()
}

// colorize reports whether the active terminal supports color. Lip Gloss v2
// keeps styles independent of the output profile, so use the profile it
// detected at startup and preserve the existing NO_COLOR behaviour.
func colorize(_ styles) bool {
	if _, disabled := os.LookupEnv("NO_COLOR"); disabled {
		return false
	}
	return compat.Profile >= colorprofile.ANSI
}

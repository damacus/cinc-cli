// Package tui contains shared Bubble Tea component styles.
package tui

import (
	"charm.land/bubbles/v2/textarea"
	"charm.land/bubbles/v2/textinput"
	"charm.land/lipgloss/v2"
	"charm.land/lipgloss/v2/compat"
)

// DefaultTextInputStyles keeps the neutral text and prompt colors used by
// Bubbles v1 while selecting the v2 cursor style for the current terminal.
func DefaultTextInputStyles() textinput.Styles {
	styles := textinput.DefaultStyles(compat.HasDarkBackground)
	styles.Focused.Prompt = lipgloss.NewStyle()
	styles.Focused.Text = lipgloss.NewStyle()
	styles.Blurred.Prompt = lipgloss.NewStyle()
	styles.Blurred.Text = lipgloss.NewStyle()
	styles.Cursor.Color = nil
	return styles
}

// DefaultTextAreaStyles retains Bubbles v1's adaptive light and dark palette.
func DefaultTextAreaStyles() textarea.Styles {
	return textarea.DefaultStyles(compat.HasDarkBackground)
}

# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig()
config.source("gruvbox.py")

c.new_instance_open_target = "window"

c.tabs.position = "top"
c.tabs.title.alignment = "center"
c.tabs.title.format = "{current_title}"

c.downloads.position = "bottom"

# Limit fullscreen to window only
c.content.fullscreen.window = True

# Only show scrollbar when searching
c.scrolling.bar = "when-searching"

c.url.default_page = "https://archlinux.org/"
c.url.start_pages = ["https://archlinux.org/"]
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "gscholar": "https://scholar.google.com/scholar?q={}",
    "scix": "https://scixplorer.org/search?p=1&q={}",
}

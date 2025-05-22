---@brief
---
--- https://github.com/crate-ci/typos
--- https://github.com/tekumara/typos-lsp
---
--- A Language Server Protocol implementation for Typos, a low false-positive
--- source code spell checker, written in Rust. Download it from the releases page
--- on GitHub: https://github.com/tekumara/typos-lsp/releases
return {
    cmd = { 'typos-lsp' },
    root_markers = {
        'typos.toml',
        '_typos.toml',
        '.typos.toml',
        'pyproject.toml',
        'Cargo.toml',
        '.git',
    },
    settings = {},
    cmd_env = { RUST_LOG = 'error' },
    init_options = {
        diagnosticSeverity = 'Hint',
    },
}

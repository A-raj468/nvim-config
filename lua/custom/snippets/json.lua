local ls = require 'luasnip'

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('json', {
    s(
        {
            trig = 'cpp',
            show_condition = function()
                return vim.fn.expand '%:t' == 'launch.json'
            end,
        },
        fmt(
            [[
{{
    "version": "0.2.0",
    "configurations": [
        {{
            "name": "(gdb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "${{workspaceFolder}}/build/{}",
            "args": ["${{workspaceFolder}}/roms/pong.rom"],
            "stopAtEntry": false,
            "cwd": "${{fileDirname}}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "setupCommands": [
                {{
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }},
                {{
                    "description": "Set Disassembly Flavor to Intel",
                    "text": "-gdb-set disassembly-flavor intel",
                    "ignoreFailures": true
                }}
            ]
        }}
    ]
}}
        ]],
            { i(1) }
        )
    ),
})

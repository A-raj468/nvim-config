local ls = require 'luasnip'

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('cpp', {
    s(
        'bits',
        fmt(
            [[
    #include <bits/stdc++.h>

    using namespace std;

    void testcase() {{
        {}
    }}

    int main(int argc, char* argv[]){{
        int t;
        cin >> t;
        while(t--) {{
            testcase();
        }}

        return 0;
    }}
        ]],
            { i(1) }
        )
    ),
})

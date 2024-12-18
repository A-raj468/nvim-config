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
    s(
        'advent_template',
        fmt(
            [[
    #include <iostream>
    #include <fstream>

    using namespace std;

    int main(int argc, char* argv[]){{
        if (argc < 2) {{
            std::cerr << "Usage: " << argv[0] << " <input_filename>\n";
            return 1;
        }}
        std::string filename = argv[1];
        std::ifstream in(filename);
        if (!in.is_open()) {{
            std::cerr << "Cannot open file: " << filename << "\n";
            return 1;
        }}
        {}
        return 0;
    }}
        ]],
            { i(1) }
        )
    ),
})

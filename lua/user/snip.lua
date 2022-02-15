local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

-- If you're reading this file for the first time, best skip to around line 190
-- where the actual snippet-definitions start.

-- Every unspecified option will be set to the default.
ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
})
-- 'recursive' dynamic snippet. Expands to some text followed by itself.
local rec_ls
rec_ls = function()
	return sn(
		nil,
		c(1, {
			-- Order is important, sn(...) first would cause infinite loop of expansion.
			t(""),
			sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
		})
	)
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
	local file = io.popen(command, "r")
	local res = {}
	for line in file:lines() do
		table.insert(res, line)
	end
	return res
end

-- Returns a snippet_node wrapped around an insert_node whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, state, fmt)
	local fmt = fmt or "%Y-%m-%d"
	return sn(nil, i(1, os.date(fmt)))
end

ls.snippets = {
	-- When trying to expand a snippet, luasnip first searches the tables for
	-- each filetype specified in 'filetype' followed by 'all'.
	-- If ie. the filetype is 'lua.c'
	--     - luasnip.lua
	--     - luasnip.c
	--     - luasnip.all
	-- are searched in that order.
	tex = {
		-- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
		-- \item as necessary by utilizing a choiceNode.
		s("ls", {
			t({ "\\begin{itemize}", "\t\\item " }),
			i(1),
			d(2, rec_ls, {}),
			t({ "", "\\end{itemize}" }),
		}),
	},
    c = {
        s(
            "head",
            fmt(
                [[
                /******************************************************************************
                * @file      {filename}
                * @authors   {Author}
                * @copyright {holder}
                * @date      {today}
                * @brief     {description}
                ******************************************************************************/
                ]],
                {
                    filename = i(1, "filename"),
                    Author = i(2, "Akash Sharma"),
                    holder = i(3, "Akash Sharma"),
                    today = i(4, os.date("%d/%m/%Y")),
                    description = i(0, "File Description")
                }
            )
        ),
    }
}

-- autotriggered snippets have to be defined in a separate table, luasnip.autosnippets.
ls.autosnippets = {
	all = {
		s("autotrigger", {
			t("autosnippet"),
		}),
	},
}

-- in a lua file: search lua-, then c-, then all-snippets.
ls.filetype_extend("lua", { "c" })
ls.filetype_extend("cpp", { "c", "h"})
require("luasnip.loaders.from_vscode").lazy_load()


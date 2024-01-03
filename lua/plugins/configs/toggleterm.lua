local M = {}

M.init_or_toggle = function()
	vim.cmd([[ ToggleTermToggleAll ]])

	-- list current buffers
	local buffers = vim.api.nvim_list_bufs()

	-- check if toggleterm buffer exists. If not then create one by vim.cmd [[ exe 1 . "ToggleTerm" ]]
	local toggleterm_exists = false
	for _, buf in ipairs(buffers) do
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if buf_name:find("toggleterm#") then
			toggleterm_exists = true
			break
		end
	end

	if not toggleterm_exists then
		vim.cmd([[ exe 1 . "ToggleTerm" ]])
	end
end

return M
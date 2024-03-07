local ulid_mod = require "deps.ulid"
local uuid_mod = require "deps.uuid"

local M = {}

function M.setup(opts)
  opts = opts or { disableKeymaps = false }
  if opts.disableKeymaps == false then
    vim.keymap.set("n", "<Leader>uu", M.uuid )
    vim.keymap.set("n", "<Leader>ul", M.ulid )
  end
end

function M.uuid()
  vim.api.nvim_put({uuid_mod.generate_v4()}, "c", true, true)
end

function M.ulid()
  local miliseconds = os.time()
  vim.api.nvim_put({ulid_mod.ulid(miliseconds)}, "c", true, true)
end

return M

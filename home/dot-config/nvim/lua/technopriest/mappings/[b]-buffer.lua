-- █▄▄ █░█ █▀▀ █▀▀ █▀▀ █▀█
-- █▄█ █▄█ █▀░ █▀░ ██▄ █▀▄
-- Buffer mappings
-- @<leader> B

require("which-key").add({
	-- Go to --
	{ "<leader>b", group = "Buffer" },
	{ "<leader><Tab>", "<cmd>BufferNext<CR>", desc = "Next Buffer" },
	{ "<leader><S-Tab>", "<cmd>BufferPrev<CR>", desc = "Previous Buffer" },
	{ "<leader>b0", "<cmd>BufferFirst<CR>", desc = "First Buffer" },
	{ "<leader>b$", "<cmd>BufferLast<CR>", desc = "Last Buffer" },
	{ "<leader>b0", "<cmd>BufferGoto 0<CR>", desc = "Go to buffer 0" },
	{ "<leader>b1", "<cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
	{ "<leader>b2", "<cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
	{ "<leader>b3", "<cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
	{ "<leader>b4", "<cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
	{ "<leader>b5", "<cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
	{ "<leader>b6", "<cmd>BufferGoto 6<CR>", desc = "Go to buffer 6" },
	{ "<leader>b7", "<cmd>BufferGoto 7<CR>", desc = "Go to buffer 7" },
	{ "<leader>b8", "<cmd>BufferGoto 8<CR>", desc = "Go to buffer 8" },
	{ "<leader>b9", "<cmd>BufferGoto 9<CR>", desc = "Go to buffer 9" },
	-- Pick and List --
	{ "<leader>bf", "<cmd>BufferPick<CR>", desc = "Pick buffer" },
	{ "<leader>bp", "<cmd>BufferPin<CR>", desc = "Toggle pin" },
	{ "<leader>br", "<cmd>BufferRestore<CR>", desc = "Restore Last" },
	{
		"<leader>bl",
		group = "buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
		desc = "List Buffers",
	},
	-- Scratch --
	{ "<leader>bs", "<cmd>Telescope scratch<CR>", desc = "New Scratch" },
	-- Order --
	{ "<leader>bo", group = "Order" },
	{ "<leader>bod", "<cmd>BufferOrderByDirectory<CR>", desc = "Directory" },
	{ "<leader>bob", "<cmd>BufferOrderByBufferNumber<CR>", desc = "Buffer number" },
	{ "<leader>bow", "<cmd>BufferOrderByBufferNumber<CR>", desc = "Window number" },
	{ "<leader>bol", "<cmd>BufferOrderByLanguage<CR>", desc = "Language" },
	{ "<leader>bon", "<cmd>BufferOrderByName<CR>", desc = "Name" },
	-- Move --
	{ "<leader>bm", group = "Move" },
	{ "<leader>bml", "<cmd>BufferMovePrev<CR>", desc = "Left" },
	{ "<leader>bmh", "<cmd>BufferMoveNext<CR>", desc = "Right" },
	{ "<leader>bm0", "<cmd>BufferMoveStart<CR>", desc = "Start" },
	{ "<leader>bm$", "<cmd>BufferMoveEnd<CR>", desc = "End" },
	-- Close --
	{ "<leader>q", group = "Close" },
	{ "<leader>qq", "<cmd>BufferClose<CR>", desc = "Current Buffer" },
	{ "<leader>qh", "<cmd>BufferCloseBuffersLeft<CR>", desc = "Left buffers" },
	{ "<leader>ql", "<cmd>BufferCloseBuffersRight<CR>", desc = "Right buffers" },
	{ "<leader>qa", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Other buffers" },
	{ "<leader>qf", "<cmd>BufferPickDelete<CR>", desc = "Other buffers" },
})

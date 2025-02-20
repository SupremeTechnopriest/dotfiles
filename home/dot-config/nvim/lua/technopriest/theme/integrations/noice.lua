return function(theme)
	local colors = theme.base_30
	return {
		NoiceCmdlinePopup = {
			fg = colors.red,
			bg = colors.black2,
		},

		NoiceCmdlinePopupTitle = {
			fg = colors.black,
			bg = colors.red,
		},

		NoiceCmdlinePopupBorderCmdline = {
			fg = colors.red,
			bg = colors.black2,
		},

		NoiceCmdlineIconCmdline = {
			fg = colors.red,
		},

		NoiceCmdlinePopupBorderHelp = {
			fg = colors.green,
			bg = colors.black2,
		},

		NoiceCmdlineIconHelp = {
			fg = colors.green,
		},
	}
end

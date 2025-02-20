return function(theme, utils)
	local colors = theme.base_30
	local mix_col = utils.mix

	return {
		DiffviewDiffAdd = { bg = mix_col(colors.green, colors.black, 85) },
		DiffviewDiffText = { bg = mix_col(colors.green, colors.black, 70) },
		DiffviewDiffChange = { bg = mix_col(colors.green, colors.black, 85) },
		DiffviewDiffDelete = { bg = mix_col(colors.red, colors.black, 70) },
		DiffviewDiffDeleteDim = { bg = mix_col(colors.red, colors.black, 85) },
		DiffviewDiffAddAsDelete = { bg = mix_col(colors.red, colors.black, 85) },
	}
end

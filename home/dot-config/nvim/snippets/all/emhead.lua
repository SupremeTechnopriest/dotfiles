return {
	s("emcopy", { -- Trigger for the snippet
		t({
			"/*",
			" * 01000101 01000100 01000111 01000101",
			" * 01001101 01000101 01010011 01001000",
			" *",
			" * Copyright © ",
		}),
		f(function()
			return tostring(os.date("%Y")) -- Get the current year
		end),
		t({
			" Edgemesh Corporation.",
			" * All rights reserved.",
			" */",
		}),
	}),
}

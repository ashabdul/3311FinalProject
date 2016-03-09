note
	description: "Summary description for {DIVIDES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DIVIDES

inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := " / "
	end

end

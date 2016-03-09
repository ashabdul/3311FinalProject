note
	description: "Summary description for {PLUS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLUS
inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := " + "
	end



end

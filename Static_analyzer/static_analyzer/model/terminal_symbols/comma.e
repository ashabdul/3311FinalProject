note
	description: "Summary description for {COMMA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMMA
inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := ", "
	end



end

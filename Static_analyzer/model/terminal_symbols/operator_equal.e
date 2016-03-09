note
	description: "Summary description for {OPERATOR_EQUAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATOR_EQUAL
inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := " = "
	end




end

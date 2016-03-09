note
	description: "Summary description for {OPERATOR_LT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATOR_LT
inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := " < "
	end




end

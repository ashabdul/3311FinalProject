note
	description: "Summary description for {MINUS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MINUS
inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := " - "
	end




end

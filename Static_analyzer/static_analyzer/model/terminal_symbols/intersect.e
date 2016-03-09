note
	description: "Summary description for {INTERSECT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INTERSECT
inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := " /\ "
	end



end

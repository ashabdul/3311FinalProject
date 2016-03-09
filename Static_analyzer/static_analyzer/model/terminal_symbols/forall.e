note
	description: "Summary description for {FORALL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FORALL
inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := "&& "
	end



end

note
	description: "Summary description for {SUM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERAND_SUM
inherit
	TERMINAL_SYMBOL

feature -- Query
	output: STRING
	do
		Result := "+ "
	end



end

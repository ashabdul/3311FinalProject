note
	description: "Summary description for {NULL_EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NULL_EXPRESSION
inherit
	COMPOSITE_EXPRESSION

create
	make,make_first
feature{NONE} -- Internal Attributes
	symbol : STRING
feature -- Attributes
	is_current : BOOLEAN
		-- is this the current item we are changing?



feature -- Constructors
	make
	do
		create symbol.make_from_string("nil")
		create {ARRAYED_LIST[EXPRESSION]}expression_list.make (0)
		is_current := false
	end
	make_first
	do
		create symbol.make_from_string("?")
		create {ARRAYED_LIST[EXPRESSION]}expression_list.make (0)
		is_current := true
	end
feature -- Queries
	output: STRING
	do
		Result := symbol
	end

	-- Dummy implementation
	add_operation (e : TERMINAL_SYMBOL)
	do
	end

feature -- perform operations
	accept(visitor : VISIT_EXPRESSION)
	do
		visitor.visit_null_expression (Current)
	end


end

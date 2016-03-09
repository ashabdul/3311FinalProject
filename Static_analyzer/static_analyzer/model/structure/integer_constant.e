note
	description: "Summary description for {INTEGER_CONSTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INTEGER_CONSTANT

inherit
	EXPRESSION

create make
feature -- Constructor
	make
	do
		create value.make_empty
	end
feature {NONE} -- Attributes
	value : STRING

feature -- Command
	set_integer_constant (i : INTEGER)
	do
		value := i.out
	end

feature -- Operation
	accept (visitor : VISIT_EXPRESSION)
	do
		visitor.visit_integer_constant (Current.deep_twin)
	end

	output : STRING
	do
		Result := value
	end
end

note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_INTEGER_CONSTANT
inherit
	ETF_ADD_INTEGER_CONSTANT_INTERFACE
		redefine add_integer_constant end
create
	make
feature -- command
	add_integer_constant(c: INTEGER)
    	do
			-- perform some update on the model state
			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			else
				model.add_integer_constant (c)
				model.pretty_print
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

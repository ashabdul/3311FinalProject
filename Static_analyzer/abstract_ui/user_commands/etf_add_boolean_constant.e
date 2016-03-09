note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_BOOLEAN_CONSTANT
inherit
	ETF_ADD_BOOLEAN_CONSTANT_INTERFACE
		redefine add_boolean_constant end
create
	make
feature -- command
	add_boolean_constant(c: BOOLEAN)
    	do
			-- perform some update on the model state

			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			else
				model.add_boolean_constant(c)
				model.set_message (model.status_ok)
				model.pretty_print
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

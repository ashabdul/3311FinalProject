note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_GENERALIZED_AND
inherit
	ETF_ADD_GENERALIZED_AND_INTERFACE
		redefine add_generalized_and end
create
	make
feature -- command
	add_generalized_and
    	do
			-- perform some update on the model state
			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			else
				model.add_generalized_and
				model.pretty_print
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

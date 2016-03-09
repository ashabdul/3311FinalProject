note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_NEGATIVE
inherit
	ETF_ADD_NEGATIVE_INTERFACE
		redefine add_negative end
create
	make
feature -- command
	add_negative
    	do
			-- perform some update on the model state
			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			else
				model.add_negative
				model.pretty_print
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

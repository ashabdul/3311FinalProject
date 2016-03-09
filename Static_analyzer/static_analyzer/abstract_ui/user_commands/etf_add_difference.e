note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_DIFFERENCE
inherit
	ETF_ADD_DIFFERENCE_INTERFACE
		redefine add_difference end
create
	make
feature -- command
	add_difference
    	do
			-- perform some update on the model state
			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			else
				model.add_difference
				model.pretty_print
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

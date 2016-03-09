note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_ADDITION
inherit
	ETF_ADD_ADDITION_INTERFACE
		redefine add_addition end
create
	make
feature -- command
	add_addition
    	do
			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			else
				model.add_addition
				model.pretty_print
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

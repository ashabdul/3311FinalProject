note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_DISJUNCTION
inherit
	ETF_ADD_DISJUNCTION_INTERFACE
		redefine add_disjunction end
create
	make
feature -- command
	add_disjunction
    	do
			-- perform some update on the model state
			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			else
				model.add_disjunction
				model.pretty_print
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

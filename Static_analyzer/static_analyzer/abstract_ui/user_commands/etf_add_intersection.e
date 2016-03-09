note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_INTERSECTION
inherit
	ETF_ADD_INTERSECTION_INTERFACE
		redefine add_intersection end
create
	make
feature -- command
	add_intersection
    	do
			-- perform some update on the model state
			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			else
				model.add_intersection
				model.pretty_print
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_END_SET_ENUMERATION
inherit
	ETF_END_SET_ENUMERATION_INTERFACE
		redefine end_set_enumeration end
create
	make
feature -- command
	end_set_enumeration
    	do
			-- perform some update on the model state
			
			if model.my_stack.is_empty and not model.is_new then
				model.set_message (model.status_completed_exp)
			elseif model.set_enum_count = 0 then
				model.set_message (model.status_enumeration_not_being_specified)
			elseif model.is_new_set then
				model.set_message (model.status_enum_must_not_be_empty)
			else
				model.end_set_enumeration
				model.set_message (model.status_ok)
				model.pretty_print
			end

			etf_cmd_container.on_change.notify ([Current])
    	end

end

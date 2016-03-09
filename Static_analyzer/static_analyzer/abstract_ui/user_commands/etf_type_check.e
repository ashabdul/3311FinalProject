note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_TYPE_CHECK
inherit
	ETF_TYPE_CHECK_INTERFACE
		redefine type_check end
create
	make
feature -- command
	type_check
    	do

    		if not model.my_stack.is_empty or (model.my_stack.is_empty and model.is_new) then
    			model.set_message (model.status_incomplete_exp)
    		elseif not model.is_type_correct then
    			model.message.make_empty
				model.message.append (model.print_expression.value)
				model.message.append (model.status_is_not_type_correct)
    		else
    			model.type_check
    		end


			etf_cmd_container.on_change.notify ([Current])
    	end

end

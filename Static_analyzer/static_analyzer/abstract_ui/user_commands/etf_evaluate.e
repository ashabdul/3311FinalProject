note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_EVALUATE
inherit
	ETF_EVALUATE_INTERFACE
		redefine evaluate end
create
	make
feature -- command
	evaluate
    	do

    		model.report.make_empty
    		model.message.make_empty
			if not model.no_expression_on_stack or (model.no_expression_on_stack and model.is_new) then
    			model.set_message (model.status_incomplete_exp)
				model.report.append (model.print_expression.value)
    		elseif not model.is_type_correct then
				model.set_message(model.status_not_type_correct_evaluate)
			    model.report.append (model.print_expression.value)
			elseif model.is_divisor_zero then
				model.set_message (model.status_divisor_zero)
				model.report.append (model.print_expression.value)
			else
    			model.evaluate
    		end

			etf_cmd_container.on_change.notify ([Current])
    	end

end



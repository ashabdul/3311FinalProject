note
	description: "Summary description for {VISIT_PRINT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VISIT_PRINT

inherit
	VISIT_EXPRESSION
create make

feature -- Constructor
	make
	do
		create {NULL_EXPRESSION}left_child.make
		create {NULL_EXPRESSION}right_child.make
		create value.make_empty
	end
feature -- Attributes
	left_child : EXPRESSION
	right_child :EXPRESSION


feature -- Give the evaluated expression
    visit_boolean_constant(e: BOOLEAN_CONSTANT)
	do
		--value := e.output
		value.make_empty
		value.append (e.output)
	end

	visit_integer_constant(e: INTEGER_CONSTANT)
	do
		value.make_empty
		value.append (e.output)
	end

	visit_addition(e: BINARY_OP)
	do
		visit_binary_op(e)

	end

	visit_conjunction(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_difference(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_disjunction(e: BINARY_OP)
	do
		visit_binary_op(e)
	end
	visit_division(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_equality(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_greater_than(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_implication(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_intersection(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_less_than(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_multiplication(e: BINARY_OP)
	do
		visit_binary_op(e)
	end



	visit_subtraction(e: BINARY_OP)
	do
		visit_binary_op(e)
	end



	visit_union(e: BINARY_OP)
	do
		visit_binary_op(e)
	end

	visit_sum(e: UNARY_OP)
	do
		visit_unary_op(e)
	end

	visit_negation(e: UNARY_OP)
	do
		visit_unary_op(e)
	end

	visit_negative(e: UNARY_OP)
	do
		visit_unary_op(e)
	end

	visit_generalized_and(e: UNARY_OP)
	do
		visit_unary_op(e)
	end

	visit_generalized_or(e: UNARY_OP)
	do
		visit_unary_op(e)
	end

	visit_set_enumeration (e : SET_ENUMERATION)

	local
			eval: VISIT_PRINT
			symbol : TERMINAL_SYMBOL
	do
		create eval.make
		create {LBRACE}symbol
		value.make_empty
		value.append (symbol.output)
		from
			e.start
		until
			e.after
		loop

        e.item.accept(eval)
		value.append (eval.value)

		if not e.is_last then
		create {COMMA}symbol
		value.append (symbol.output)
		end

		e.forth

		end
		create {RBRACE}symbol
		value.append (symbol.output)


	end

	visit_null_expression (e  : NULL_EXPRESSION)

	do
		value.make_empty
		value.append (e.output)
	end

feature{NONE} -- Internal Attributes
	visit_binary_op (e : BINARY_OP)
	local
		symbol : TERMINAL_SYMBOL
		eval : VISIT_PRINT
	do
		create eval.make
		create {LPAREN}symbol
		value.make_empty
		value.append (symbol.output)
		e.left.accept (eval)
		value.append (eval.value)
		value.append (e.operator.output)
		e.right.accept (eval)
		value.append (eval.value)
		create {RPAREN}symbol
		value.append (symbol.output)

	end
	visit_unary_op (e : UNARY_OP)
	local
		symbol : TERMINAL_SYMBOL
		eval : VISIT_PRINT
	do
		create eval.make
		create {LPAREN}symbol
		value.make_empty
		value.append (symbol.output)
		value.append (e.operator.output)

		e.child.accept (eval)
		value.append (eval.value)
		create {RPAREN}symbol
		value.append (symbol.output)
	end
end

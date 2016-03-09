note
	description: "Summary description for {VISIT_EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	VISIT_EXPRESSION
feature -- Attributes
	value :STRING

feature
	visit_boolean_constant(e: BOOLEAN_CONSTANT)
	deferred
	end

	visit_integer_constant(e: INTEGER_CONSTANT)
	deferred
	end

	visit_addition(e: BINARY_OP)
	deferred
	end

	visit_conjunction(e: BINARY_OP)
	deferred
	end

	visit_difference(e: BINARY_OP)
	deferred
	end

	visit_disjunction(e: BINARY_OP)
	deferred
	end

	visit_division(e: BINARY_OP)
	deferred
	end

	visit_equality(e: BINARY_OP)
	deferred
	end

	visit_generalized_and(e: UNARY_OP)
	deferred
	end

	visit_generalized_or(e: UNARY_OP)
	deferred
	end

	visit_greater_than(e: BINARY_OP)
	deferred
	end

	visit_implication(e: BINARY_OP)
	deferred
	end

	visit_intersection(e: BINARY_OP)
	deferred
	end

	visit_less_than(e: BINARY_OP)
	deferred
	end

	visit_multiplication(e: BINARY_OP)
	deferred
	end

	visit_negation(e: UNARY_OP)
	deferred
	end

	visit_negative(e: UNARY_OP)
	deferred
	end

	visit_subtraction(e: BINARY_OP)
	deferred
	end

	visit_sum(e: UNARY_OP)
	deferred
	end

	visit_union(e: BINARY_OP)
	deferred
	end

	visit_set_enumeration (e : SET_ENUMERATION)
	deferred

	end

	visit_null_expression (e  : NULL_EXPRESSION)
	deferred
	end

end

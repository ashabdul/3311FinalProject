note
	description: "Summary description for {VISIT_EVALUATE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VISIT_EVALUATE

inherit
	VISIT_EXPRESSION
create make

feature -- Constructor
	make
	do
		create value.make_empty
		create set_enum_list.make (0)
	end

feature -- Extra Attributes
	set_enum_list : ARRAYED_LIST[STRING]

feature -- Give the evaluated expression
	visit_addition(e: BINARY_OP)
	local
		i : INTEGER
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create set_enum_list.make (0)
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_integer
	    e.right.accept(right_visit_evaluate)
		i := i + right_visit_evaluate.value.to_integer
		value.make_empty
		value.append (i.out)
	end

	visit_subtraction(e: BINARY_OP)
	local
		i : INTEGER
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create set_enum_list.make (0)
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_integer
	    e.right.accept(right_visit_evaluate)
		i := i - right_visit_evaluate.value.to_integer
		value.make_empty
		value.append (i.out)
	end

	visit_multiplication(e: BINARY_OP)
	local
		i : INTEGER
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create set_enum_list.make (0)
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_integer
	    e.right.accept(right_visit_evaluate)
		i := i * right_visit_evaluate.value.to_integer
		value.make_empty
		value.append (i.out)
	end

	visit_division(e: BINARY_OP)
	local
		i : INTEGER
		j: DOUBLE
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create set_enum_list.make (0)
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_integer
		e.right.accept(right_visit_evaluate)
		j := (i / right_visit_evaluate.value.to_integer)
		if j > 0 then
			i := j.floor
		else
			i := j.ceiling
		end
		value.make_empty
		value.append (i.out)
	end

	visit_boolean_constant(e: BOOLEAN_CONSTANT)
	do
		value.make_empty
		value.append (e.output)
	end

	visit_integer_constant(e: INTEGER_CONSTANT)
	do
		value.make_empty
		value.append (e.output)
	end

	visit_conjunction(e: BINARY_OP)
	local
		i : BOOLEAN
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_boolean
		e.right.accept(right_visit_evaluate)
		i := i and right_visit_evaluate.value.to_boolean
		value.make_empty
		value.append (i.out)
	end

	visit_disjunction(e: BINARY_OP)
	local
		i : BOOLEAN
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_boolean
		e.right.accept(right_visit_evaluate)
		i := i or right_visit_evaluate.value.to_boolean
		value.make_empty
		value.append (i.out)
	end


	visit_equality(e: BINARY_OP)
	local
		left_child_array : ARRAYED_LIST[STRING]
		right_child_array : ARRAYED_LIST[STRING]
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
		bool : BOOLEAN
	do
		create set_enum_list.make (0)
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept (left_visit_evaluate)
		e.right.accept (right_visit_evaluate)
	if left_visit_evaluate.set_enum_list.is_empty or right_visit_evaluate.set_enum_list.is_empty  then
		bool := (left_visit_evaluate.value ~ right_visit_evaluate.value)
	else
		bool :=
		across left_visit_evaluate.set_enum_list as left
		all
			across right_visit_evaluate.set_enum_list as right
			some
				left.item ~ right.item
			end
		end

		bool := bool and
		across right_visit_evaluate.set_enum_list as right
		all
			across left_visit_evaluate.set_enum_list as left
			some
				left.item ~ right.item
			end
		end
	end
		value.make_empty
		value.append (bool.out)
	end

	visit_implication(e: BINARY_OP)
	local
		i : BOOLEAN
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_boolean
		e.right.accept(right_visit_evaluate)
		i := i implies right_visit_evaluate.value.to_boolean
		value.make_empty
		value.append (i.out)
	end

	visit_less_than(e: BINARY_OP)
	local
		i : INTEGER
		b : BOOLEAN
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_integer
	    e.right.accept(right_visit_evaluate)
		b := i < right_visit_evaluate.value.to_integer
		value.make_empty
		value.append (b.out)
	end

	visit_greater_than(e: BINARY_OP)
	local
		i : INTEGER
		b : BOOLEAN
		left_visit_evaluate : VISIT_EVALUATE
		right_visit_evaluate : VISIT_EVALUATE
	do
		create left_visit_evaluate.make
		create right_visit_evaluate.make
		e.left.accept(left_visit_evaluate)
		i := left_visit_evaluate.value.to_integer
	    e.right.accept(right_visit_evaluate)
		b := i > right_visit_evaluate.value.to_integer
		value.make_empty
		value.append (b.out)
	end


	visit_generalized_and(e: UNARY_OP)
	local
		b : BOOLEAN
		visit_evaluate : VISIT_EVALUATE
	do
		create set_enum_list.make (0)
		create visit_evaluate.make
		b := true
		e.child.accept (visit_evaluate)

		across visit_evaluate.set_enum_list as cursor
		loop
			b := b and cursor.item.to_boolean
		end
		value.make_empty
		value.append (b.out)
	end

	visit_generalized_or(e: UNARY_OP)
	local
		b : BOOLEAN
		visit_evaluate : VISIT_EVALUATE
	do
		create set_enum_list.make (0)
		create visit_evaluate.make
		b := true
		e.child.accept (visit_evaluate)

		across visit_evaluate.set_enum_list as cursor
		loop
			b := b or cursor.item.to_boolean
		end
		value.make_empty
		value.append (b.out)
	end

	visit_negation(e: UNARY_OP)
	local
		b : BOOLEAN
		visit_evaluate : VISIT_EVALUATE
		symbol : TERMINAL_SYMBOL
	do
		create set_enum_list.make (0)
		create visit_evaluate.make
		b := true
		e.child.accept (visit_evaluate)

		b := not visit_evaluate.value.to_boolean


		value.append (b.out)

	end

	visit_sum(e: UNARY_OP)
	local
		i : INTEGER
		visit_evaluate : VISIT_EVALUATE
	do
		create set_enum_list.make (0)
		create visit_evaluate.make
		e.child.accept (visit_evaluate)

		across visit_evaluate.set_enum_list as cursor
		loop
			i := i + cursor.item.to_integer
		end
		value.make_empty
		value.append (i.out)
	end

	visit_intersection(e: BINARY_OP)
	local
		visit_evaluate_left : VISIT_EVALUATE
		visit_evaluate_right : VISIT_EVALUATE
		symbol : TERMINAL_SYMBOL
	do
		create set_enum_list.make (0)
		create visit_evaluate_left.make
		create visit_evaluate_right.make
		e.left.accept (visit_evaluate_left)
		e.right.accept (visit_evaluate_right)

		across visit_evaluate_left.set_enum_list as left
		loop
			across visit_evaluate_right.set_enum_list as right
			loop
				if left.item ~ right.item then
					set_enum_list.extend (left.item)
				end
			end
		end

		value.make_empty
		print_set_enumeration
	end

	visit_union(e: BINARY_OP)
	local
		visit_evaluate_left : VISIT_EVALUATE
		visit_evaluate_right : VISIT_EVALUATE
		symbol : TERMINAL_SYMBOL
	do
		create set_enum_list.make (0)
		create visit_evaluate_left.make
		create visit_evaluate_right.make
		e.left.accept (visit_evaluate_left)
		e.right.accept (visit_evaluate_right)

		across visit_evaluate_left.set_enum_list as left
		loop
			set_enum_list.extend (left.item)
		end
		across visit_evaluate_right.set_enum_list as right
		loop
			set_enum_list.extend (right.item)
		end
		set_enum_list := remove_repeating_elements_in_set (set_enum_list)
		value.make_empty
		print_set_enumeration
	end



	visit_negative(e: UNARY_OP)
	local
		i : INTEGER
		visit_evaluate : VISIT_EVALUATE
		symbol : TERMINAL_SYMBOL
	do
		create set_enum_list.make (0)
		create visit_evaluate.make

		e.child.accept (visit_evaluate)
		i := -1*visit_evaluate.value.to_integer

		value.make_empty
		value.append (i.out)
	end



	visit_difference(e: BINARY_OP)
	local
		visit_evaluate_left : VISIT_EVALUATE
		visit_evaluate_right : VISIT_EVALUATE
		set_list : ARRAYED_LIST[STRING]
		index_to_add : ARRAYED_LIST[INTEGER]
		symbol : TERMINAL_SYMBOL
		dummy_b : BOOLEAN
	do
		create set_enum_list.make (0)
		create visit_evaluate_left.make
		create visit_evaluate_right.make
		create set_list.make (0)
		create index_to_add.make(0)

		e.left.accept (visit_evaluate_left)
		e.right.accept (visit_evaluate_right)
		-- Set the initial list to the first list


		across visit_evaluate_left.set_enum_list as other_list loop
			dummy_b:=
			across visit_evaluate_right.set_enum_list as my_list
			all
				not (other_list.item ~ my_list.item)
			end
			if dummy_b then
				set_list.extend (other_list.item)
			end
		end
		across visit_evaluate_right.set_enum_list as other_list loop
			dummy_b:=
			across visit_evaluate_left.set_enum_list as my_list
			all
				not (other_list.item ~ my_list.item)
			end
			if dummy_b then
				set_list.extend (other_list.item)
			end
		end
		-- remove duplicates
		set_list := remove_repeating_elements_in_set (set_list.deep_twin)
		set_enum_list := set_list.deep_twin
		value.make_empty

		print_set_enumeration

	end

	visit_set_enumeration (e : SET_ENUMERATION)
	local
		visit_evaluate : VISIT_EVALUATE
	do
		create set_enum_list.make (0)
		create visit_evaluate.make
		from
			e.start
		until
			e.after
		loop
			e.item.accept (visit_evaluate)

			set_enum_list.extend (visit_evaluate.value.deep_twin)
			e.forth
		end
		set_enum_list := remove_repeating_elements_in_set (set_enum_list.deep_twin)
		value.make_empty
		print_set_enumeration
	end
	-- No need
	visit_null_expression (e  : NULL_EXPRESSION)
	do
	end

feature{NONE}-- Internal Functios
	remove_repeating_elements_in_set (set_enum :ARRAYED_LIST[STRING]) : ARRAYED_LIST[STRING]

	do
		create Result.make (0)

		across set_enum as cursor
		loop
			if Result.is_empty then
				Result.extend (cursor.item)


			elseif across Result as second_list
				all
					cursor.item /~ second_list.item
			    end

				then
					Result.extend(cursor.item)
				end
		end
	end

	print_set_enumeration
	local
		symbol : TERMINAL_SYMBOL
	do
		create {LBRACE}symbol
		--value.make_empty
		value.append (symbol.output)


		across set_enum_list as cursor
		loop
			value.append (cursor.item.out)

			if not cursor.is_last then
				create {COMMA}symbol
				value.append (symbol.output)
			end
		end
		create {RBRACE}symbol
		value.append (symbol.output)
	end

end

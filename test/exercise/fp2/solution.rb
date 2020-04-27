module Exercise
  module Fp2
    class MyArray < Array
      def my_each(acc = MyArray.new([]), &func)
        head, *tail = self
        acc << head

        yield head

        if tail.empty?
          acc
        else
          MyArray.new(tail).my_each(acc, &func)
        end
      end

      def my_map
        my_reduce MyArray.new do |acc, element|
          acc << yield(element)
        end
      end

      def my_compact
        my_reduce MyArray.new do |acc, element|
          element.nil? ? acc : MyArray.new([*acc, element])
        end
      end

      def my_reduce(initial = nil, &func)
        head, *tail = self
        has_initial = !initial.nil?
        acc = has_initial ? initial : head
        current_value = has_initial ? head : tail.first
        new_acc = yield(acc, current_value)

        if tail.empty?
          new_acc
        else
          MyArray.new(tail).my_reduce(initial ? new_acc : head, &func)
        end
      end
    end
  end
end

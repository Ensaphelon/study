module Exercise
  module Fp2
    class MyArray < Array
      def my_each
        for element in self
          yield element
        end
      end

      def my_map
        new_array = MyArray.new
        self.my_each do |element|
          new_array.push(yield element)
        end
        new_array
      end

      def my_compact
        new_array = MyArray.new
        self.my_each do |element|
          !element.nil? && new_array.push(element)
        end
        new_array
      end

      def my_reduce(initial = nil, &block)
        has_initial = !initial.nil?
        acc = has_initial ? initial : self[0]
        first, *rest = self
        array = has_initial ? self : MyArray.new(rest)
        array.my_each do |element| 
          acc = yield(acc, element) 
        end
        acc
      end
    end
  end
end

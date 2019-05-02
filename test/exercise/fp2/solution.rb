require 'pry'

module Exercise
  module Fp2
    class MyArray < Array
      def remove_head(_array)
        _array[1..(_array.length - 1)]
      end

      def first(_array)
        _array[0]
      end

      def _each(_array, _initial_array, &block)
        length = _array.length

        if length > 0
          current_element = first(_array)
          rest_elements = remove_head(_array)

          yield(current_element)

          _each(rest_elements, _initial_array, &block)
        end

        MyArray.new(_initial_array)
      end

      def _map(_array, _modified_array, index, &block)
        length = _array.length

        if length > 0
          current_element = first(_array)
          rest_elements = remove_head(_array)
          _modified_array[index] = yield(current_element)

          _map(rest_elements, _modified_array, index + 1, &block)
        end

        MyArray.new(_modified_array)
      end

      def _compact(_array, _modified_array, &block)
        length = _array.length

        if length > 0
          current_element = first(_array)
          rest_elements = remove_head(_array)
          index = _modified_array.length > 0 ? _modified_array.length : 0

          if current_element != nil
            _modified_array[index] = current_element
          end

          _compact(rest_elements, _modified_array, &block)
        end

        MyArray.new(_modified_array)
      end

      def _reduce(acc = nil, _array, &block)
        accumulator_presents = acc != nil
        length = _array.length

        if length > 0
          current_element = accumulator_presents ? first(_array) : _array[1]
          rest_elements = remove_head(_array)

          acc = accumulator_presents ? yield(acc, current_element) : first(_array)

          _reduce(acc, rest_elements, &block)
        else
          acc
        end
      end

      def my_each(&block)
        _each(self, self, &block)
      end

      def my_map(&block)
        _map(self, [], 0, &block)
      end

      def my_compact(&block)
        _compact(self, [], &block)
      end

      def my_reduce(acc = nil, &block)
        _reduce(acc, self, &block)
      end
    end
  end
end

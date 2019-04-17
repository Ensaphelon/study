module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |number| number > 0 ? max : number }
      end

      def search(_array, _query, index = 0)
        length = _array.length

        if length == 0
          return -1
        end

        if length == 1
          return _array[0] == _query ? index : -1
        end

        left_part, right_part = _array.each_slice((_array.size/2.0).round).to_a
        current_value = left_part[-1]

        if current_value == _query
          return index
        end

        if current_value < _query
          self.search(right_part, _query, left_part.length + index)
        else
          self.search(left_part, _query, index)
        end
      end
    end
  end
end

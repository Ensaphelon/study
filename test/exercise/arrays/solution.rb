module Exercise
  module Arrays
    class << self
      def max(array)
        array.reduce do |acc, current|
          acc > current ? acc : current
        end
      end

      def replace(array)
        maximum = max(array)
        array.map do |number|
          number.positive? ? maximum : number
        end
      end

      def search(array, query, index = 0)
        length = array.length

        return -1 if length == 0
        return array[0] == query ? index : -1 if length == 1

        left_part, right_part = array.each_slice((array.size / 2.0).round).to_a
        current_value = left_part[-1]

        return index if current_value == query

        if current_value < query
          search(right_part, query, left_part.length + index)
        else
          search(left_part, query, index)
        end
      end
    end
  end
end

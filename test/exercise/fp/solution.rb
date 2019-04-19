module Exercise
  module Fp
    class << self
      def get_films_with_countries(_films)
        _films.select do |film|
          film["country"].to_s.split(',').length >= 2
        end
      end

      def get_films_with_non_zero_rating(_films)
        _films.select do |film|
          film["rating_kinopoisk"].to_f > 0
        end
      end

      def get_films_with_rating_threshold(_films, _threshold)
        _films.select do |film|
          film["rating_kinopoisk"].to_f >= _threshold
        end
      end

      def get_summary_rating(_films)
        _films.reduce(0) do | accumulator, film |
          accumulator + film["rating_kinopoisk"].to_f
        end
      end

      def get_characters_count_in_film_name(_film, _char)
        characters = _film["name"].split('').select do | char |
          _char == char
        end

        return characters.length
      end

      def rating(_films)
        films_with_countries = get_films_with_countries(_films)
        films_with_rating = get_films_with_non_zero_rating(films_with_countries)
        summary_rating = get_summary_rating(films_with_rating)
        average_rating = summary_rating / films_with_rating.length

        return average_rating
      end

      def chars_count(_films, _threshold)
        films_with_rating = get_films_with_rating_threshold(_films, _threshold)

        chars_count = films_with_rating.reduce(0) do | accumulator, film |
          accumulator + get_characters_count_in_film_name(film, 'и')
        end

        return chars_count
      end
    end
  end
end

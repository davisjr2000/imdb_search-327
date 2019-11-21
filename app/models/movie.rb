class Movie < ApplicationRecord
  belongs_to :director

  include PgSearch::Model

  # multisearchable against: [:title, :syllabus]

  pg_search_scope :global_search,
    against: [:title, :syllabus ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    # pg_search_scope :method_name,
    # against: [:column],
    # options:
end


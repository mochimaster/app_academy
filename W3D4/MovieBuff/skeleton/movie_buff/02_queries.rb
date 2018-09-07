def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
<<<<<<< HEAD
  Movie
  .select(:id, :title, :yr, :score)
  .where('yr BETWEEN 1980 AND 1989 AND score BETWEEN 3 AND 5')
=======
>>>>>>> b49c2c6bf00e9b5b8e72991fce8f75f59c6fc6b5

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
<<<<<<< HEAD
  Movie
  .group(:yr)
  .having('MAX(score) < 8')
  .pluck(:yr)
  # .having('score < 8')
  
  # SELECT 
  #   year
  # FROM
  #   movies
  # HAVING
  #   score < 8
  # GROUP BY
  #   year
  
=======

>>>>>>> b49c2c6bf00e9b5b8e72991fce8f75f59c6fc6b5
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
<<<<<<< HEAD
  # Actor
  # .select(:id, :name)
  # .joins(:castings)
  # .
  # Actor 
  #   .joins(:movies)
  #   .where(movies: { title: title })
  # 
  #   # .where('movies.title = ?', title)
  Actor
    .joins(:movies)
    .where(movies: {title: title})
    .order('castings.ord')
=======

>>>>>>> b49c2c6bf00e9b5b8e72991fce8f75f59c6fc6b5
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
<<<<<<< HEAD
  # Movie
  #   .joins(:actors)
  #   .select(:id, :title, 'actors.name', 'castings.actor_id')
  #   .where('castings.ord = 1')
  # 
  # 
  
  Movie
  .select(:id,:title,'actors.name')
  .joins(:actors)
  .where('movies.director_id = actors.id')
  .where('castings.ord = 1')

  
  # 
  # SELECT 
  #   title
  # FROM 
  #   movies
  # JOIN
  #   castings ON castings.movie_id = movies.id
  # JOIN
  #   actors ON actors.id = castings.actor_id
  # WHERE 
  #   movies.director_id = actors.id
  # 
=======

>>>>>>> b49c2c6bf00e9b5b8e72991fce8f75f59c6fc6b5
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

end

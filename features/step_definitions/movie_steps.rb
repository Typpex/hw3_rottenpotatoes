# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    m = Movie.create!(movie)
    if m == nil
      flunk "No movies inserted"
    end
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  ind_e1 = /#{e1}/ =~ page.body
  ind_e2 = /#{e2}/ =~ page.body
  if !ind_e1.nil? and !ind_e2.nil?
    if ind_e1 > ind_e2
      flunk "Wrong sorting"
    end
  else
    flunk "No movies !"
  end
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    if uncheck.nil? 
      step "I check \"ratings_#{rating}\""
    else
      step "I uncheck \"ratings_#{rating}\""
    end
  end
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

class Post < ActiveRecord::Base

  searchable do
    text :name

    string :sort_name do
      name.downcase.gsub(/^(an?|the)/, '')
    end
  end


end

class Vs003 < ApplicationRecord
  def self.getTagList
    tags = Hash.new(0)
    self.all.each do |v|
      tags[v.tag] += 1
    end
    return tags.sort.to_h
  end
end

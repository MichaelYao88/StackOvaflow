def vote_total(object)
  total = object.votes.where(value: 1).count - object.votes.where(value: -1).count
  total
end

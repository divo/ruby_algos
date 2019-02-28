# License Plate Game
# 1 pt for every unique license plate seen
# Scored individually

# Ex:
# Player   | Plates Seen | Total Points
# ---------+-------------+-------------
# Player 1 | California  | 4
#          | Nevada      |
#          | Arizona     |
#          | Colorado    |
# ---------+-------------+-------------
# Player 2 | Nevada      | 3
#          | Utah        |
#          | Utah        |
#          | Arizona     |
# ---------+-------------+-------------
# Player 3 | Arizona     | 1
#          | Arizona     |


# New Scoring —- Western States
# 1 pt for every border crossed from the state you are in to the state on the plate
# Scored individually

# Ex: Driving in California
# Player   | Plates Seen | Points for Plate | Total Points
# ---------+-------------+------------------+-------------
# Player 1 | California  | 0                | 4
#          | Nevada      | 1                |
#          | Colorado    | 3                |
# ---------+-------------+------------------+-------------
# Player 2 | Nevada      | 1                | 4
#          | Utah        | 2                |
#          | Arizona     | 1                |
# ---------+-------------+------------------+-------------
# Player 3 | California  | 0                | 2
#          | New Mexico  | 2                |

#    State    |    Neighbors
# ------------+----------------------------------------
# California  | Arizona, Nevada
# Nevada      | Arizona, California, Utah
# Arizona     | California, New Mexico, Nevada, Utah
# Utah        | Arizona, Colorado, Nevada
# New Mexico  | Arizona, Colorado
# Colorado    | New Mexico, Utah
# ------------+----------------------------------------

def plate_game(plates)
  seen = {}
  plates.each do | plate |
    seen[plate] = 1
  end
  seen.keys.count
end

def state_distance(from, neighbours, to, acc=1, visited = [])
  return 0 if from == to
  
  visited.push from
  return unless neighbours[from]
  return acc if neighbours[from].include?(to)
  result = []
  neighbours[from].each do | neighbour | 
    if (visited.include?(neighbour) == false)
      visited.push neighbour
      result.push state_distance(neighbour, neighbours, to, acc + 1, visited)
    end
  end
  result.min
end

# route is hash of states, each entry is array of seen plates
def road_trip_game(route, neighbours)
  seen_plate_scores = {}
  route.each do |state, plates|
    plates.each do |plate|
      points = state_distance(state, neighbours, plate)
      seen_plate_scores[plate] = seen_plate_scores[plate].nil? ? [points] : seen_plate_scores[plate].push(points)
    end
  end
  
  result = {}
  seen_plate_scores.each do |plate, scores|
    result[plate] = scores.max
  end
  result
end

#puts plate_game %w{California Nevada Nevada Colorado}
neighbours = Hash.new()
neighbours["California"] = ["Arizona", "Nevada"]
neighbours["Nevada"] = ["Arizona", "California", "Utah"]
neighbours["Arizona"] = ["California", "New Mexico", "Nevada", "Utah"]
neighbours["Utah"] = ["Arizona", "Colorado", "Nevada"]
neighbours["New Mexico"] = ["Arizona", "Colorado"]
neighbours["Colorado"] = ["New Mexico", "Utah"]
state_distance("California", neighbours, "California" )


route = Hash.new()
route["California"] = ["Arizona", "California", "Utah"]
route["Nevada"] =  ["Arizona", "Nevada"]
route["Arizona"] =  ["New Mexico", "Utah"]
print road_trip_game(route, neighbours)

# I lost you again. I can't hear you. I don't know if you're still looking at this. 


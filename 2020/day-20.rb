# Part one

data = File.read("data_20.txt")

tiles = {}

data.split("\n\n").each do |tile|
  id, tile = tile.match(/Tile (\d+):\n([\s\S]+)/).captures
  id = id.to_i
  tile = tile.split("\n").map { |tile| tile.chars }
  
  tiles[id] = tile
end

def flip(tile)
  tile.map { |column| column.reverse }
end
  
def rotate(tile)
  tile.transpose.map {|row| row.reverse }
end
  
def borders(tile)
  [tile.first, tile.last, tile.transpose.first, tile.transpose.last]
end

adjacent = Hash.new { |h, k| h[k] = [] }

tiles.keys.combination(2) do |tile_1, tile_2|
  tile_1_borders = borders(tiles[tile_1])
  tile_2_borders = borders(tiles[tile_2]) + borders(tiles[tile_2]).map { |border| border.reverse }

  tile_1_borders.each.with_index do |border_1, idx|
    tile_2_borders.each.with_index do |border_2, idx2|
      if border_1 == border_2
        adjacent[tile_1] << tile_2
        adjacent[tile_2] << tile_1
      end
    end
  end
end

corner_tiles = adjacent.keys.reject { |tile_id| adjacent[tile_id].count != 2 }

puts "Part one answer: #{ corner_tiles.reduce(:*) }"
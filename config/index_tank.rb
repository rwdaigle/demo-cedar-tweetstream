require 'indextank'

INDEX_TANK_IDX = "idx"

$index_tank = IndexTank::Client.new(ENV['INDEXTANK_API_URL'])
$index = $index_tank.indexes(INDEX_TANK_IDX)

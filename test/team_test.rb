require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/player'
require_relative '../lib/team'

class TeamTest < Minitest::Test

  def setup
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end



  def test_it_exists
  # skip
    team = Team.new("France")
    assert_instance_of Team, team
  end

  def test_it_has_attributes
    team = Team.new("France")
    assert_equal "France", team.country
    assert_equal false, team.eliminated?
    team.eliminated = true
    assert_equal true, team.eliminated?
    assert_equal [], team.players
  end

  def test_it_can_add_players
    team = Team.new("France")
    team.add_player(@mbappe)
    assert_equal [@mbappe], team.players
    team.add_player(@pogba)
    assert_equal [@mbappe, @pogba], team.players
  end

  def test_it_can_find_player_by_position
    team = Team.new("France")
    team.add_player(@mbappe)
    team.add_player(@pogba)
    assert_equal [@pogba], team.players_by_position("midfielder")
    assert_equal [], team.players_by_position("defender")

  end



end

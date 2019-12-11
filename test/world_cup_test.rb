require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/player'
require_relative '../lib/team'
require_relative '../lib/world_cup'

class WorldCupTest < Minitest::Test

  def setup
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @france = Team.new("France")
    @croatia = Team.new("Croatia")
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
  end

  def test_it_can_build_teams
    assert_equal [@mbappe, @pogba], @france.players
    assert_equal [@modric, @vida], @croatia.players
  end

  def test_it_exists
    world_cup = WorldCup.new(2018, [@france, @croatia])
    assert_instance_of WorldCup, world_cup
  end

  def test_it_has_attributes
    world_cup = WorldCup.new(2018, [@france, @croatia])
    assert_equal 2018, world_cup.year
    assert_equal [@france, @croatia], world_cup.teams
  end

  def test_for_active_players_by_position
    world_cup = WorldCup.new(2018, [@france, @croatia])
    assert_equal [@pogba, @modric], world_cup.active_players_by_position("midfielder")
    @croatia.eliminated = true
    assert_equal [@pogba], world_cup.active_players_by_position("midfielder")

  end

end

require 'test_helper'

class GalaxiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @galaxy = galaxies(:one)
  end

  test "should get index" do
    get galaxies_url
    assert_response :success
  end

  test "should get new" do
    get new_galaxy_url
    assert_response :success
  end

  test "should create galaxy" do
    assert_difference('Galaxy.count') do
      post galaxies_url, params: { galaxy: { diameter: @galaxy.diameter, distance: @galaxy.distance, galaxy_type: @galaxy.galaxy_type, mass: @galaxy.mass, notable_features: @galaxy.notable_features, num_stars: @galaxy.num_stars } }
    end

    assert_redirected_to galaxy_url(Galaxy.last)
  end

  test "should show galaxy" do
    get galaxy_url(@galaxy)
    assert_response :success
  end

  test "should get edit" do
    get edit_galaxy_url(@galaxy)
    assert_response :success
  end

  test "should update galaxy" do
    patch galaxy_url(@galaxy), params: { galaxy: { diameter: @galaxy.diameter, distance: @galaxy.distance, galaxy_type: @galaxy.galaxy_type, mass: @galaxy.mass, notable_features: @galaxy.notable_features, num_stars: @galaxy.num_stars } }
    assert_redirected_to galaxy_url(@galaxy)
  end

  test "should destroy galaxy" do
    assert_difference('Galaxy.count', -1) do
      delete galaxy_url(@galaxy)
    end

    assert_redirected_to galaxies_url
  end
end

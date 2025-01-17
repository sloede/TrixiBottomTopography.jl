using TrixiBottomTopography

# Free end condition
@testset "Free end" begin

  # Define data path
  data = "data/rhine_1d_10_x_1.txt"

  # Define B-spline structure
  spline_struct = cubic_b_spline(data)
  # Define B-spline interpolation function
  spline_func(x) = spline_interpolation(spline_struct, x)

  # Test function at arbitrary point
  @test spline_func(357555) == 46.19366216271698

end


# Free end condition with smoothing
@testset "Free end + smoothing" begin

  # Define data path
  data = "data/rhine_1d_10_x_100.txt"

  # Define B-spline structure
  spline_struct = cubic_b_spline(data; smoothing_factor = 9999)
  # Define B-spline interpolation function
  spline_func(x) = spline_interpolation(spline_struct, x)

  # Test function at arbitrary point
  @test spline_func(357555) == 47.85931152002955
    
end

# Not-a-knot end condition
@testset "Not-a-knot end" begin
    
  # Define data path
  data = "data/rhine_1d_10_y_1.txt"

  # Define B-spline structure
  spline_struct = cubic_b_spline(data; end_condition = "not-a-knot")
  # Define B-spline interpolation function
  spline_func(x) = spline_interpolation(spline_struct, x)

  # Test function at arbitrary point
  @test spline_func(5646555) == 47.929379673188045

end

# Not-a-knot end condition with smoothing
@testset "Not-a-knot end + smoothing" begin

  # Define data path
  data = "data/rhine_1d_10_y_100.txt"

  # Define B-spline structure
  spline_struct = cubic_b_spline(data; end_condition = "not-a-knot", smoothing_factor = 9999)
  # Define B-spline interpolation function
  spline_func(x) = spline_interpolation(spline_struct, x)

  # Test function at arbitrary point
  @test spline_func(5646555) == 47.71995039495247

end

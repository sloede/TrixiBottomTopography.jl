"""
    TrixiBottomTopography

**TrixiBottomTopography** is a supporting framework for Trixi.jl, which can
be used to approximate bottom topography functions using B-splines from 
real life data.
"""
module TrixiBottomTopography

  # Include necessary packages
  using LinearAlgebra: norm, diagm, Tridiagonal, SymTridiagonal
  using SparseArrays: sparse, spzeros

  # Include one dimesnional B-spline interpolation
  include("1D/spline_cache_1D.jl")
  include("1D/spline_methods_1D.jl")
  include("1D/spline_utils_1D.jl")

  # Include two dimesnional B-spline interpolation
  include("2D/spline_cache_2D.jl")
  include("2D/spline_methods_2D.jl")
  include("2D/spline_utils_2D.jl")
 
  # Include auxiliary functions
  include("auxiliary/convert.jl")

  # Export the functions which are used for B-spline interpolation
  export linear_b_spline, cubic_b_spline
  export bilinear_b_spline, bicubic_b_spline
  export spline_interpolation

  # Export the functions which are used DGM data conversion
  export convert_dgm_1d, convert_dgm_2d

end

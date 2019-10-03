# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

# TODO refactoring this !!!!!!!!!!!!!!!
def triangle(a, b, c)
  raise TriangleError, "wrong sides, cannot be zero or less than zero" if (a<= 0 || b<= 0 || c<= 0)
  return :equilateral if (a==b && b==c) 
  return :scalene if (a!=b && b!=c && c!=a) 
    
  if ((a==b && a!=c) || (a==c && b!=a) ||(b==c && c!=a))
    if verifyingIsosceles([a,b,c])
      return :isosceles
    else
      raise TriangleError, "wrong isoseles triangle"
    end
  end
end

def verifyingIsosceles(sides)
  ordered_sides = sides.group_by {|i| i}

  repeated_side = ordered_sides.select {|k, v| v.count > 1}.keys
  not_repeated_side = ordered_sides.select {|k, v| v.count == 1}.keys

  repeated_side[0] * 2 > not_repeated_side[0]
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

class StaticPagesController < ApplicationController
  def home
    @locations = Location.find(1,2,3,4,5,6,7,8,9)
    @lastloc = Location.last
    @slastloc = Location.second_to_last
    @tlastloc = Location.third_to_last
  end
end

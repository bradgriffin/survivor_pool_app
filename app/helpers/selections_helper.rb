module SelectionsHelper
  def current_week(time)
  	@week1 = Time.new(2012,9,10,22,15,0,"-05:00")
  	@week2 = Time.new(2012,9,17,22,30,0,"-05:00")
  	@week3 = Time.new(2012,9,24,22,30,0,"-05:00")
  	@week4 = Time.new(2012,10,1,22,30,0,"-05:00")
      
    if time < @week1
      return 1
    elsif time > @week1 && time < @week2
      return 2
    elsif time < @week2 && time < @week3
      return 3
    elsif time < @week3 && time < @week4
      return 4
    end
  end
end
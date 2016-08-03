class Timer

 attr_accessor :seconds 

 def seconds
  @seconds = 0
 end

 def time_string
  sec_dec = (@seconds/60.0)
  min_dec = (sec_dec.floor/60.0)
 
  minutes = ((min_dec - min_dec.floor)*60).abs   
  hours = min_dec.floor
  secs = ((sec_dec-sec_dec.floor)*60).abs

  return format("%02d:%02d:%02d",hours,minutes,secs)
 end
 
end

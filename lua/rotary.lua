print("Breathing Lamp Start")
-- pwm.setup(1,1000,1023); -- set pot 1 PWM mode frequency 1000hz and the duty cycle 1023pwm.start(1);

tmr.alarm(2,100,1,function() --Timer 2 using the timing 100ms Repeatability
  local r=adc.read(0)
  print("Got value for rotary encoder: " + r)
  if(r<1024) then -- the most analog read is 1024 but the most PWM’ duty cycle is 1023
    print("Above max value for rotary encoder")
    -- pwm.setduty(1,r); -- set the port 1 PWM’s duty cycle is “r” else pwm.setduty(1,1023); end
end)

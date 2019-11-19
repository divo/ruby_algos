setup do
  puts 'setting up sky'
  @sky_height = 100
end

setup do
  puts 'setting up mountains'
  @mountains_height = 200
end

event 'the sky is falling' do
  @sky_height < 300
end

event 'its getting closer' do
  @sky_height < @mountains_height
end

event 'too late' do
  @sky_height < 0
end

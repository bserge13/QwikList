every 1.day, at: '11:00 am' do
  runner "DateJob.perform_async"
end
desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :tweets do
    puts "Updating feed..."
    Tweet.refresh
    puts "done."
end

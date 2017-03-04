config.autoload_paths += Dir["#{Rails.root}/app/jobs"]

class TestJob
  include SuckerPunch::Job

  def perform
    sleep 1
    puts "starting job..."
    sleep 10
    puts "job ready!"
    TestJob.perform_in(30.seconds)
  end
end

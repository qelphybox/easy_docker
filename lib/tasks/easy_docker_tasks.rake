# desc "Explaining what the task does"
# task :easy_docker do
#   # Task goes here
# end

namespace :docker do
  desc 'Install docker files'
  task :install do
    Rails::Generators.invoke("docker")
  end
end

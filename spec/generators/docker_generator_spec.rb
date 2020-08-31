RSpec.describe 'DockerGenerator' do
  subject { Rails::Generators.invoke("docker") }

  specify 'create Dockerfile' do
    subject
  end
end

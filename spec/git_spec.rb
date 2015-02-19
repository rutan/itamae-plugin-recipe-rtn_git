require 'spec_helper'

describe command('git --version') do
  let(:disable_sudo) { true }
  its(:stdout) { should match 'git version 2.2.2' }
end

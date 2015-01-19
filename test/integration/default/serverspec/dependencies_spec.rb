require 'spec_helper'

describe package('gcc') do
  it { should be_installed }
end

describe package('gcc-c++') do
  it { should be_installed }
end

describe package('make') do
  it { should be_installed }
end

describe package('openssl-devel') do
  it { should be_installed }
end
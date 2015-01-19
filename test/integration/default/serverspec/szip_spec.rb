require 'spec_helper'

describe file('/usr/local/lib/libsz.so') do
  it { should be_file }
  it { should be_symlink }
end

describe file('/usr/local/lib/libsz.so.2') do
  it { should be_file }
  it { should be_symlink }
end

describe file('/usr/local/lib/libsz.a') do
  it { should be_file }
end

describe file('/usr/local/lib/libsz.la') do
  it { should be_file }
end
require 'spec_helper'

describe file('/usr/local/lib/libz.so') do
  it { should be_file }
  it { should be_symlink }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libz.so.1') do
  it { should be_file }
  it { should be_symlink }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libz.a') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
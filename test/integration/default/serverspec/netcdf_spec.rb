require 'spec_helper'

describe file('/usr/local/lib/libnetcdf.a') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libnetcdf.la') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libnetcdf.so') do
  it { should be_file }
  it { should be_symlink }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libnetcdf.so.7') do
  it { should be_file }
  it { should be_symlink }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libnetcdf.so.7.2.0') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/bin/nc-config') do
  it { should be_file }
  it { should be_executable }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

%w{nc-config  nccopy  ncdump  ncgen  ncgen3}.each do |file|
  describe file("/usr/local/bin/#{file}") do
    it { should be_file }
    it { should be_executable }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end
require 'spec_helper'

describe file('/usr/local/lib/libhdf5.a') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5_hl.a') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5_hl.la') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5_hl.so') do
  it { should be_file }
  it { should be_symlink }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5_hl.so.9') do
  it { should be_file }
  it { should be_symlink }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5_hl.so.9.0.0') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5.la') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5.so') do
  it { should be_file }
  it { should be_symlink }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5.so.9') do
  it { should be_file }
  it { should be_symlink }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/lib/libhdf5.so.9.0.0') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

%w{gif2h5  h52gif  h5cc  h5copy  h5debug  h5diff  h5dump  h5import  h5jam  h5ls  h5mkgrp  h5perf_serial  h5redeploy  h5repack  h5repart  h5stat  h5unjam}.each do |file|
  describe file("/usr/local/bin/#{file}") do
    it { should be_file }
    it { should be_executable }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end

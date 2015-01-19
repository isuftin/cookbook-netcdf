require "spec_helper"

describe "netcdf::hdf5" do
  
  let (:chef_run) do |runner|
    ChefSpec::SoloRunner.new({:file_cache_path => '/tmp/cache'}) do |runner|
      runner.node.set['netcdf']['hdf5']['version'] = "1.0.0"
    end.converge(described_recipe)
  end
  
  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("/usr/local/lib/libhdf5.so").and_return(false)
  end
  
  it "Downloads the hdf5 source" do
    expect(chef_run).to create_remote_file("/tmp/cache/hdf5-1.0.0.tar.gz").with(source: "http://www.hdfgroup.org/ftp/HDF5/prev-releases/hdf5-1.0.0/src/hdf5-1.0.0.tar.gz")
  end

  it "Skips compiling and installing the hdf5 source" do
    expect(chef_run).to_not run_bash("install hdf5")
  end
end
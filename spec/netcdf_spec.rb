require "spec_helper"

describe "netcdf::netcdf" do
  
  let (:chef_run) do |runner|
    ChefSpec::SoloRunner.new({:file_cache_path => '/tmp/cache'}) do |runner|
      runner.node.set['netcdf']['netcdf']['version'] = "1.0.0"
    end.converge(described_recipe)
  end
  
  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("/usr/local/lib/libnetcdf.so").and_return(false)
  end
  
  it "Downloads the netcdf source" do
    expect(chef_run).to create_remote_file("/tmp/cache/netcdf-1.0.0.tar.gz").with(source: "https://codeload.github.com/Unidata/netcdf-c/tar.gz/1.0.0")
  end

  it "Skips compiling and installing the netcdf source" do
    expect(chef_run).to_not run_bash("install netcdf")
  end
end
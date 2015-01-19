require "spec_helper"

describe "netcdf::szip" do
  
  let (:chef_run) do |runner|
    ChefSpec::SoloRunner.new({:file_cache_path => '/tmp/cache'}) do |runner|
      runner.node.set['netcdf']['szip']['version'] = "1.0.0"
    end.converge(described_recipe)
  end
  
  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("/usr/local/lib/libsz.so").and_return(false)
  end
  
  it "Downloads the szip source" do
    expect(chef_run).to create_remote_file("/tmp/cache/szip-1.0.0.tar.gz").with(source: "http://www.hdfgroup.org/ftp/lib-external/szip/1.0.0/src/szip-1.0.0.tar.gz")
  end

  it "Skips compiles and installs the szip source" do
    expect(chef_run).to_not run_bash("install szip")
  end
end
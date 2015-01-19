require "spec_helper"

describe "netcdf::zlib" do
  
  let (:chef_run) do |runner|
    ChefSpec::SoloRunner.new({:file_cache_path => '/tmp/cache'}) do |runner|
      runner.node.set['netcdf']['zlib']['version'] = "1.0.0"
    end.converge(described_recipe)
  end
  
  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("/usr/local/lib/libz.so").and_return(false)
  end
  
  it "Downloads the zlib source" do
    expect(chef_run).to create_remote_file("/tmp/cache/zlib-1.0.0.tar.gz").with(source: "http://zlib.net/zlib-1.0.0.tar.gz")
  end

  it "Compiles and installs the zlib source" do
    expect(chef_run).to_not run_bash("install zlib")
  end
end
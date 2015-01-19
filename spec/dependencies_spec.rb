require "spec_helper"

describe "netcdf::dependencies" do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it "installs the gcc package" do
    expect(chef_run).to install_package("gcc")
  end
  
  it "installs the gcc-c++ package" do
    expect(chef_run).to install_package("gcc-c++")
  end
  
  it "installs the make package" do
    expect(chef_run).to install_package("make")
  end
  
  it "installs the openssl-devel package" do
    expect(chef_run).to install_package("openssl-devel")
  end
end
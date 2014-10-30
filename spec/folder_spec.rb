require_relative '../lib/selenium-reporter/system/folder'

describe 'Folder manipulation' do

  before(:all) do
    @loc = ENV['SE_OUTPUT_DIR'] = File.join(Dir.pwd, 'spec/results')
  end

  before(:each) do
    FileUtils.rm_rf(@loc)
  end

  after(:all) do
    FileUtils.rm_rf(@loc)
  end

  it 'directory exists' do
    FileUtils.mkdir_p(@loc)
    expect(SeleniumReporter::System::Folder.send(:exist?)).to eql true
  end

  it 'directory creation' do
    SeleniumReporter::System::Folder.send(:create!)
    expect(SeleniumReporter::System::Folder.send(:exists?)).to eql true
  end

  it 'empty' do
    SeleniumReporter::System::Folder.send(:create!)
    SeleniumReporter::System::Folder.send(:empty!)
    expect(SeleniumReporter::System::Folder.send(:empty?)).to eql true
  end

  it 'clean' do
    SeleniumReporter::System::Folder.send(:clean!)
    expect(SeleniumReporter::System::Folder.send(:empty?)).to eql false
    expect(SeleniumReporter::System::Folder.send(:exists?)).to eql true
  end

end

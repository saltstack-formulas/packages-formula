# frozen_string_literal: true

### WANTED/REQUIRED
control 'Wanted/Required gems' do
  title 'should be installed'

  wanted = %w[
    progressbar
    minitest
  ]
  case platform[:name]
  when 'centos', 'amazon'
    wanted.delete('minitest')
  end

  wanted.each do |p|
    describe gem(p) do
      it { should be_installed }
    end
  end
end

### UNWANTED
control 'Unwanted gems' do
  title 'should be uninstalled'
  %w[
    diff-lcs
    kwalify
    kitchen-vagrant
  ].each do |p|
    describe gem(p) do
      it { should_not be_installed }
    end
  end
end

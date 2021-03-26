# frozen_string_literal: true

pkgs_wanted = %w[Firefox jq notepadplusplus]
pkgs_unwanted = %w[GoogleChrome hg]

### WANTED
control 'Wanted packages' do
  title 'should be installed'

  pkgs_wanted.each do |p|
    describe chocolatey_package(p) do
      it { should be_installed }
    end
  end
end

### UNWANTED
control 'Unwanted packages' do
  title 'should be uninstalled'

  pkgs_unwanted.each do |p|
    describe chocolatey_package(p) do
      it { should_not be_installed }
    end
  end
end

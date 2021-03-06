require 'spec_helper'

describe 'keepalived', :type => :class do
  let (:facts) { debian_facts }

  describe 'without parameters' do
    it { should create_class('keepalived') }
    it { should include_class('keepalived::install') }
    it { should include_class('keepalived::config') }
    it { should include_class('keepalived::service') }

    it { should contain_package('keepalived').with(
        'ensure' => 'present'
      )
    }

    it { should contain_file('/etc/keepalived/keepalived.conf').with(
        'ensure' => 'present',
        'group'  => 'root',
        'mode'   => '0644',
        'owner'  => 'root'
      )
    }

    it { should contain_service('keepalived').with(
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'false',
        'hasstatus'  => 'false'
      )
    }
  end

  describe 'with parameter: config_dir' do
    let (:params) { { :config_dir => '_VALUE_' } }

    it { should contain_file('_VALUE_').with(
        'ensure' => 'directory'
      )
    }
  end

  describe 'with parameter: config_dir_mode' do
    let (:params) { { :config_dir_mode => '_VALUE_' } }

    it { should contain_file('/etc/keepalived').with(
        'mode' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_file_mode' do
    let (:params) { { :config_file_mode => '_VALUE_' } }

    it { should contain_file('/etc/keepalived/keepalived.conf').with(
        'mode' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_group' do
    let (:params) { { :config_group => '_VALUE_' } }

    it { should contain_file('/etc/keepalived').with(
        'group' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_owner' do
    let (:params) { { :config_owner => '_VALUE_' } }

    it { should contain_file('/etc/keepalived').with(
        'owner' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: pkg_ensure' do
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it { should contain_package('keepalived').with(
        'ensure' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: pkg_list' do
    let (:params) { { :pkg_list => '_VALUE_' } }

    it { should contain_package('_VALUE_') }
  end

  describe 'with parameter: service_enable' do
    let (:params) { { :service_enable => true } }

    it { should contain_service('keepalived').with(
        'enable' => true
      )
    }
  end

  describe 'with parameter: service_ensure' do
    let (:params) { { :service_ensure => '_VALUE_' } }

    it { should contain_service('keepalived').with(
        'ensure' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: service_hasrestart' do
    let (:params) { { :service_hasrestart => true } }

    it { should contain_service('keepalived').with(
        'hasrestart' => true
      )
    }
  end

  describe 'with parameter: service_hasstatus' do
    let (:params) { { :service_hasstatus => true } }

    it { should contain_service('keepalived').with(
        'hasstatus' => true
      )
    }
  end

  describe 'with parameter: service_name' do
    let (:params) { { :service_name => '_VALUE_' } }

    it { should contain_service('_VALUE_').with(
        'name' => '_VALUE_'
      )
    }
  end
end


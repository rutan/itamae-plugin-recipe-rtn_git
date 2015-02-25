# encoding: utf-8

node[:rtn_git] ||= {}
node[:rtn_git][:version] ||= '2.3.0'
node[:rtn_git][:archive_path] ||= 'https://github.com/git/git/archive/'
node[:rtn_git][:archive_url] ||= "#{node[:rtn_git][:archive_path]}v#{node[:rtn_git][:version]}.tar.gz"
node[:rtn_git][:install_path] ||= '/usr/local'

define :git_install, install_path: nil, archive_url: nil do
  params = self.params

  tmp_dir = '/tmp'
  filename = File.basename(params[:archive_url])
  dirname = "git-#{params[:name]}"

  packages = %w[wget gcc gettext]
  case os[:family]
  when %r(debian|ubuntu)
    packages << 'libssl-dev'
    packages << 'libcurl4-openssl-dev'
    packages << 'libexpat1-dev'
  when %r(redhat)
    packages << 'openssl-devel'
    packages << 'libcurl-devel'
    packages << 'expat-devel'
    packages << 'perl-ExtUtils-MakeMaker'
  else
    raise 'not supported your OS'
  end
  packages.each &method(:package)

  execute "cd #{tmp_dir} && wget #{params[:archive_url]} -O #{tmp_dir}/#{filename}" do
    not_if "test -O #{tmp_dir}/#{filename}"
  end

  execute "cd #{tmp_dir} && \
           tar zxvf #{filename}"
  execute "cd #{tmp_dir}/#{dirname} && \
           make prefix=#{params[:install_path]} all && \
           make prefix=#{params[:install_path]} install"

  execute 'add path' do
    command "echo 'PATH=#{params[:install_path]}/bin:$PATH' > /etc/profile.d/git.sh"
  end
end

git_install node[:rtn_git][:version] do
  install_path node[:rtn_git][:install_path]
  archive_url node[:rtn_git][:archive_url]
  not_if ". /etc/profile && git --version | grep '#{node[:rtn_git][:version]}'"
end



package 'firewalld' do
  package_name   %w(firewalld)
  action         :install # defaults to :install if not specified
end

service 'firewalld' do
  pattern 'firewalld'
  action [:enable, :start]
end
  
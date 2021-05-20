override['linux_patching']['patch'] = {
  'enable' => true,
  'hour' => 4,
  'minute' => 0,
  'monthly' => nil,
  'platforms' => 'all',
  'reboot' => true,
  'splay' => 0,
  'weekly' => 'sunday',
}

override['linux_patching']['pre_config'] = {
  'enable' => false,
  'weekday' => 0,
  'weekly' => 'sunday',
}

override['linux_patching']['post_config'] = {
  'enable' => false,
  'weekday' => 0,
  'weekly' => 'sunday',
}

node.override['linux_patching']['patch']['script'] =
  case node['platform_family']
  when 'amazon', 'rhel'
    [
      'yum update -y',
      'yum clean -y',
    ]
  when 'arch'
    [
      'pacman -S pacman-contrib --noconfirm',
      'pacman -Syu --noconfirm',
      'pacman -Rns $(pacman -Qtdq) --noconfirm',
      'paccache -r',
    ]
  when 'debian'
    [
      'apt update -y',
      'apt autoremove -y',
      'apt clean',
    ]
  end

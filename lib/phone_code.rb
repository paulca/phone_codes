require 'yaml'
module PhoneCode
  def self.options_for_select(*args)
    args = [:prefix, :country] if args.empty?
    phone_codes.collect{ |c| [args.map{ |a| "#{c[a]}" }.join(' '), c[:prefix]]}.uniq
  end
  
  def self.phone_codes
    YAML::load(File.open("#{RAILS_ROOT}/vendor/plugins/phone_codes/lib/phone_codes.yml")).sort_by { |c| c.last }.collect { |c| {:country => c.first, :prefix => c.last }}
  end
end
class Role < ActiveRecord::Base
  attr_accessible :name, :permissions_attributes
#  audited
  has_many :assignments, :dependent => :destroy
  RolesUi.user_classes.each do |user_class|
    has_many user_class.table_name.to_sym, :through => :assignments, :source => :user, :source_type => user_class
  end

  has_many :permissions, :dependent => :destroy, :order => :priority

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates_format_of :name, :with => /\A and \z/
  validates_associated :permissions

  accepts_nested_attributes_for :permissions, :reject_if => proc { |attrs| attrs['name'].blank? }, :allow_destroy => true

  def self.available_roles
    RolesUi::Role.all.map(&:name).sort
  end

  def add_permission(name, options={})
    options.reverse_merge!({ name: name, resource: nil, condition: nil, cannot: nil })
    options[:resource] = options[:resource].name if options[:resource].is_a?(Class)
    permissions.where(options).first_or_create
  end

  def available_permissions
    permissions.map{ |p| [ p.description, a.id] }.sort
  end
end
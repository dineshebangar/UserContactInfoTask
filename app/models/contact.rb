class Contact < ActiveRecord::Base

has_many :addresses, :dependent => :destroy
has_many :phone_nos, :dependent => :destroy
belongs_to :user
accepts_nested_attributes_for :addresses, :allow_destroy => true, :reject_if => :all_blank
accepts_nested_attributes_for :phone_nos, :allow_destroy => true, :reject_if => proc { |attributes| attributes['mob'].blank? }
    



end

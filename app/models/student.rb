class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Student < ActiveRecord::Base
validates :name, presence: { message: "must be given please" }, 
				 length:{minimum: 2, maximum: 20}
validates :email, email: true, presence: true, uniqueness: true
validates :age, presence: true,
			  length: {maximum: 3}, numericality: true
end	

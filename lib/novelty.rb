class Novelty
	include DataMapper::Resource
	property :id,         Integer,  :serial => true
	property :amount,     Integer,  :default => 0
	property :url,        String,   :nullable => false
end

module Netjockey
  # Module for Netjockey error classes
  module Errors
    autoload :StandardError, 'netjockey/errors/standard_error'
    autoload :EntityNotFoundError, 'netjockey/errors/entity_not_found_error'
    autoload :InvalidEntityHashError, 'netjockey/errors/invalid_entity_hash_error'
  end
end

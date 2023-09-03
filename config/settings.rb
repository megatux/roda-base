require "dry/configurable"
require "concurrent/atomic/read_write_lock"
require "dotenv"
require "pathname"
require_relative "types"

class Settings
  extend Dry::Configurable

  setting :root, default: "#{__dir__}/..", constructor: ->(path) { Pathname(path).expand_path }, reader: true
  setting :env, default: ENV.fetch("RACK_ENV", "development"), reader: true
  setting :logger, default: Logger.new($stdout), reader: true

  Dotenv.load(root.join(".env"))
end

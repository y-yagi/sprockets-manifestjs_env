$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "sprockets/manifestjs_env"
require "minitest/autorun"

def silence_stream(stream)
  old_stream = stream.dup
  stream.reopen(IO::NULL)
  stream.sync = true
  yield
ensure
  stream.reopen(old_stream)
  old_stream.close
end

def quietly
  silence_stream(STDOUT) do
    silence_stream(STDERR) do
      yield
    end
  end
end

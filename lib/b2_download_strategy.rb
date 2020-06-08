require "uri"
require "download_strategy"

class B2DownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    parsed = URI(url)
    raise "Invalid scheme for B2: #{parsed.scheme}" unless parsed.scheme == "b2"
    unless parsed.host == "backblazeb2.com"
      raise "Currently only backblazeb2.com is supported as B2 host: #{parsed.host}"
    end
    _, @bucket, @file = parsed.path.split("/", 3)
    raise "URL must contain a bucket and a file path" unless [@bucket, @file].all?
  end
  
  def ensure_credentials
    @key_id = ENV["HOMEBREW_B2_KEY_ID"]
    @app_key = ENV["HOMEBREW_B2_APPLICATION_KEY"]
    onoe "Missing HOMEBREW_B2_KEY_ID" if @key_id.blank?
    onoe "Missing HOMEBREW_B2_APPLICATION_KEY" if @app_key.blank?
    raise "Missing credentials for #{url}" unless [@app_key, @key_id].all?
  end

  private

  def _fetch(url:, resolved_url:)
    require "b2"
    ensure_credentials
    b2 = B2.new(key_id: @key_id, secret: @app_key)
    url = b2.get_download_url(@bucket, @file)
    curl_download(url, to: temporary_path)
  rescue LoadError
    raise "Install the b2-client gem into the gem repo used by brew."
  end
end

class DownloadStrategyDetector
  original_detect_from_url = singleton_class.instance_method(:detect_from_url)
  original_detect_from_symbol = singleton_class.instance_method(:detect_from_symbol)
  
  singleton_class.define_method(:detect_from_url) do |url|
    return B2DownloadStrategy if url.match %r{^b2://}
    original_detect_from_url.bind(self).(url)
  end
  
  singleton_class.define_method(:detect_from_symbol) do |symbol|
    return B2DownloadStrategy if symbol == :b2
    original_detect_from_symbol.bind(self).(symbol)
  end
end

require 'uri'
require "download_strategy"

class B2DownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    get_credentials
    parse_url
  end
  
  def get_credentials
    @key_id = ENV["HOMEBREW_B2_KEY_ID"]
    @app_key = ENV["HOMEBREW_B2_APPLICATION_KEY"]
    onoe "Missing HOMEBREW_B2_KEY_ID" if @key_id.blank?
    onoe "Missing HOMEBREW_B2_APPLICATION_KEY" if @app_key.blank?
    raise "Missing credentials for #{url}" unless [@app_key, @key_id].all?
  end
  
  def parse_url
    parsed = URI(url)
    raise "Invalid scheme for B2: #{parsed.scheme}" unless parsed.scheme == "b2"
    unless ["backblazeb2.com", "", nil].include? parsed.host
      raise "Unsupported B2 host (only backblazeb2.com is allowed): #{parsed.host}"
    end
    _, @bucket, @file = parsed.path.split('/', 3)
    raise "No bucket name specified" if @bucket.blank?
    raise "No file path specified" if @file.blank?
  end

  private

  def _fetch(url:, resolved_url:)
    begin
      require "b2"
    rescue LoadError
      raise "Install the b2-client gem into the gem repo used by brew."
    end
    b2 = B2.new(key_id: @key_id, secret: @app_key)
    url = b2.get_download_url(@bucket, @file)
    curl_download(url, to: temporary_path)
  end
end

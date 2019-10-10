require "spec"
require "../src/garnet_spec"

class FakeHandler
  def call(context)
    response = { headers: context.request.headers.to_h }.to_json
    context.response.write(response.to_slice)
  end
end

module GarnetSpec
  HANDLER = FakeHandler.new
  PATH = "/usr/bin/chromedriver"

  class Server
    CAPABILITIES = {
      browserName:              "chrome",
      version:                  "",
      platform:                 "ANY",
      javascriptEnabled:        true,
      takesScreenshot:          true,
      handlesAlerts:            true,
      databaseEnabled:          true,
      locationContextEnabled:   true,
      applicationCacheEnabled:  true,
      browserConnectionEnabled: true,
      cssSelectorsEnabled:      true,
      webStorageEnabled:        true,
      rotatable:                true,
      acceptSslCerts:           true,
      nativeEvents:             true,
      chromeOptions:            { args: ["--headless", "window-size=1920,1200", "--disable-gpu", "--disable-dev-shm-usage", "--no-sandbox", "--disable-extensions"], w3c: false },
    }
  end
end

PagSeguro.configure do |config|
	# Sandbox
	config.token = "6C2023E0E5874B37A5521EA041930691"
	# Production
	# config.token = "BE23540ADB144CEF8B6432C766D5A701"
	config.email = "mirassol.code@gmail.com"
	config.environment = :sandbox # ou :sandbox. O padrão é production.
	config.encoding = "UTF-8"
end
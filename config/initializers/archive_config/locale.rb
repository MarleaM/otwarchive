begin
  ActiveRecord::Base.connection
  # try to set language and locale using models (which use Archive Config)
  Language.default
  Locale.default
rescue ActiveRecord::ConnectionNotEstablished
  # no database connection
rescue  
  # ArchiveConfig didn't work, try to set it manually
  if Language.table_exists? && Locale.table_exists?
    language = Language.find_or_create_by_short_and_name(:short => 'en', :name => 'English')
  end
end

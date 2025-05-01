require_relative "library_cli"

cli = LibraryCli.new
cli.add_sample_data
cli.run

install:
	bundle install
cop:
	bundle exec rubocop
fix:
	bundle exec rubocop --auto-correct-all
fmt: fix
run:
	bundle exec ruby lib/artemis.rb
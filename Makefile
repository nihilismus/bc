setup:
	./bin/setup

console:
	./bin/console

server:
	bundle exec puma -C ./config/puma.rb ./config.ru

build:
	bundle exec rake build

build-checksum:
	bundle exec rake build:checksum

clean:
	bundle exec rake clean

clobber:
	bundle exec rake clobber

install:
	bundle exec rake install

install-local:
	bundle exec rake install:local

remote:
	bundle exec rake release

spec:
	bundle exec rake spec

rubocop:
	bundle exec rake rubocop

rubocop-autocorrect:
	bundle exec rake rubocop:auto_correct

rubycritic:
	bundle exec rake rubycritic

simplecov: spec

environment:
	bundle exec gem environment

check:
	bundle check

doctor:
	bundle doctor

outdated:
	bundle outdated

update:
	bundle update

package:
	bundle package

platform:
	bundle platform

tasks:
	bash resources/test.sh all

.PHONY: exe spec
.DEFAULT_GOAL := spec

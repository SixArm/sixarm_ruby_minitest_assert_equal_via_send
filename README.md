<img src="README.png" width="960" height="120" alt="README" />

# SixArm.com → Ruby → minitest<br> assert_equal_via_send assert & expect

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_minitest_assert_equal_via_send.svg)](http://badge.fury.io/rb/sixarm_ruby_minitest_assert_equal_via_send)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_minitest_assert_equal_via_send.png)](https://travis-ci.org/SixArm/sixarm_ruby_minitest_assert_equal_via_send)
[![Code Climate](https://api.codeclimate.com/v1/badges/d4ab7df02c1d65f0e8e2/maintainability)](https://codeclimate.com/github/SixArm/sixarm_ruby_minitest_assert_equal_via_send/maintainability)

* Git: <https://github.com/SixArm/sixarm_ruby_minitest_assert_equal_via_send>
* Doc: <http://sixarm.com/sixarm_ruby_minitest_assert_equal_via_send/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_minitest_assert_equal_via_send>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [changes](CHANGES.md), [license](LICENSE.md), [contributing](CONTRIBUTING.md).

<!--header-shut-->

## Introduction

Minitest extension that compares two objects via the `#send` method.

  * If `exp.send(args)` is equal to `act.send(args)`, then the test passes. 

Assert:

   * assert_equal_via_send(exp, act, [:method_name, param_1, param2], msg)

   * refute_equal_via_send(exp, act, [:method_name, param_1, param2], msg)

Spec:

   * expect(act).must_equal_via_send(exp, [:method_name, param_1, param2], msg)

   * expect(act).wont_equal_via_send(exp, [:method_name, param_1, param2], msg)

Based on Minitest.

For docs go to <http://sixarm.com/sixarm_ruby_minitest_assert_equal_via_send/doc>

Want to help? We're happy to get pull requests.


<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_minitest_assert_equal_via_send

### Gemfile

To add this gem to your Gemfile:

    gem 'sixarm_ruby_minitest_assert_equal_via_send'

### Require

To require the gem in your code:

    require 'sixarm_ruby_minitest_assert_equal_via_send'

<!--install-shut-->


## Examples

Example setup

    @exp = [:alpha, :bravo]
    @act = [:alpha, :charlie]

Example minitest assert:

    def test_me
      assert_equal_via_send(@exp, @act, [:has_key?, :alpha])
    end

Example minitest spec:

    it "works" do
      expect(@act).must_equal_via_send(@exp, [:has_key?, :alpha])
    end


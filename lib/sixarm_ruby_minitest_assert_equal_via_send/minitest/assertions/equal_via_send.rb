# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

module MiniTest::Assertions
 
  ##
  # Succeeds when +expect_value+ and +equal_via_sends(:equal_via_send_symbol)+ are equal.
  #
  def assert_equal_via_send(expect, actual, send_args, msg = nil)
    expect_value, actual_value = setup_equal_via_send(expect, actual, send_args, msg)
    assert_equal(expect_value, actual_value, "Expected equal." + result_msg(expect_value, actual_value, send_args, msg))
  end

  ##
  # Succeeds when +expect_value+ and +equal_via_sends(:equal_via_send_symbol)+ are not equal.

  def refute_equal_via_send(expect, actual, send_args, msg = nil)
    expect_value, actual_value = setup_equal_via_send(expect, actual, send_args, msg)
    refute_equal(expect_value, actual_value, "Expected not equal." + result_msg(expect_value, actual_value, send_args, msg))
  end

  private

  def setup_equal_via_send(expect, actual, send_args, msg = nil)
    refute_nil(expect, "Expected `expect`, but got nil." + append_msg(msg))
    refute_nil(actual, "Expected `actual`, but got nil." + append_msg(msg))
    refute_nil(send_args, "Expected `send_args`, but got nil." + append_msg(msg))
    expect_value = expect.send(*send_args)
    refute_nil(expect_value, "Expected `expect_value`, but got nil." + append_msg(msg))
    actual_value = actual.send(*send_args)
    refute_nil(actual_value, "Expected `actual_value`, but got nil." + append_msg(msg))
    return expect_value, actual_value
  end

  def append_msg(msg = nil)
    msg ? " #{msg}" : ""
  end

  def result_msg(expect_value, actual_value, send_args, msg = nil)
    " Send method:#{send_args ? send_args.first : send_args.inspect}. Expect value:#{expect_value.inspect}. Actual value:#{actual_value.inspect}" + append_msg(msg)
  end

end

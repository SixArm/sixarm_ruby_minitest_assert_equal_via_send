# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

module Minitest::Expectations
  infect_an_assertion :assert_equal_via_send, :must_equal_via_send
  infect_an_assertion :refute_equal_via_send, :wont_equal_via_send
end


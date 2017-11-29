# -*- coding: utf-8 -*-
require "sixarm_ruby_minitest_assert_equal_via_send"

class C
  attr_accessor :x
end

describe "Minitest" do

  before do
    @exp = C.new
    @act = C.new
  end

  describe "Assertions" do

    describe "#assert_equal_via_send" do

      describe "with typical cases" do

        specify "valid" do
          @exp.x = :a
          @act.x = :a
          assert_equal_via_send(@exp, @act, [:x])
        end

        specify "invalid" do
          @exp.x = :a
          @act.x = :b
          err = proc { 
            assert_equal_via_send(@exp, @act, [:x])
          }.must_raise MiniTest::Assertion
          err.message.must_match(/\bExpected equal\b/)
        end

      end
    
      describe "with degenerate cases" do

        describe "with `expect` nil" do

          specify "raise" do
            @exp = nil
            @act.x = :a
            err = proc {
              assert_equal_via_send(@exp, @act, [:x])
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `expect`, but got nil\b/)
          end

        end

        describe "with `actual` nil" do

          specify "raise" do
            @exp.x = :a
            @act = nil
            err = proc {
              assert_equal_via_send(@exp, @act, [:x])
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `actual`, but got nil\b/)
          end

        end

        describe "with `expect_value` nil" do

          specify "raise" do
            @exp.x = nil
            @act.x = :a
            err = proc {
              assert_equal_via_send(@exp, @act, [:x])
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `expect_value`, but got nil\b/)
          end

        end

        describe "with `actual_value` nil" do

          specify "raise" do
            @exp.x = :a
            @act.x = nil
            err = proc {
              assert_equal_via_send(@exp, @act, [:x])
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `actual_value`, but got nil\b/)
          end

        end

        describe "with `send_args` nil" do

          specify "raise" do
            @exp.x = :a
            @act.x = :a
            err = proc {
              assert_equal_via_send(@exp, @act, nil)
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `send_args`, but got nil\b/)
          end

        end

      end

    end

    describe "#refute_equal_via_send" do

      describe "with typical cases" do

        specify "valid" do
          @exp.x = :a
          @act.x = :b
          refute_equal_via_send(@exp, @act, [:x])
        end

        specify "invalid" do
          @exp.x = :a
          @act.x = :a
          err = proc { 
            refute_equal_via_send(@exp, @act, [:x])
          }.must_raise MiniTest::Assertion
          err.message.must_match(/\bExpected not equal\b/)
        end

      end

      describe "with degenerate cases" do

        describe "with `expect` nil" do

          specify "raise" do
            @exp = nil
            @act.x = :a
            err = proc {
              assert_equal_via_send(@exp, @act, [:x])
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `expect`, but got nil\b/)
          end

        end

        describe "with `actual` nil" do

          specify "raise" do
            @exp.x = :a
            @act = nil
            err = proc {
              assert_equal_via_send(@exp, @act, [:x])
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `actual`, but got nil\b/)
          end

        end

        describe "with `expect_value` nil" do

          specify "raise" do
            @exp.x = nil
            @act.x = :a
            err = proc {
              assert_equal_via_send(@exp, @act, [:x])
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `expect_value`, but got nil\b/)
          end

        end

        describe "with `actual_value` nil" do

          specify "raise" do
            @exp.x = :a
            @act.x = nil
            err = proc {
              assert_equal_via_send(@exp, @act, [:x])
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `actual_value`, but got nil\b/)
          end

        end

        describe "with `send_args` nil" do

          specify "raise" do
            @exp.x = :a
            @act.x = :a
            err = proc {
              assert_equal_via_send(@exp, @act, nil)
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bExpected `send_args`, but got nil\b/)
          end

        end

      end
    end

  end 

end

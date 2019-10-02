# -*- coding: utf-8 -*-
require "sixarm_ruby_minitest_assert_equal_via_send"

describe "Minitest" do

  class self::C
    attr_accessor :x
  end  
  
  before do
    @exp = self.class::C.new
    @act = self.class::C.new
  end

  describe "Expectations" do

    describe "#must_equal_via_send" do

      describe "with typical cases" do

        specify "valid" do
          @exp.x = :a
          @act.x = :a
          expect(@act).must_equal_via_send(@exp, [:x])
        end

        specify "invalid" do
          @exp.x = :a
          @act.x = :b
          expect { 
            expect(@act).must_equal_via_send(@exp, [:x])
          }.must_raise MiniTest::Assertion
          begin
            expect(@act).must_equal_via_send(@exp, [:x])
          rescue MiniTest::Assertion => err
            expect(err.message).must_match(/\bExpected equal\b/)
          end
        end

      end

      describe "with degenerate cases" do

        describe "with `expect` nil" do

          specify "raise" do
            @exp = nil
            @act.x = :a
            expect {
              expect(@act).must_equal_via_send(@exp, [:x])
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).must_equal_via_send(@exp, [:x])
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `expect`, but got nil\b/)
            end
          end

        end

        describe "with `actual` nil" do

          specify "raise" do
            @act = nil
            @exp.x = :a
            expect {
              expect(@act).must_equal_via_send(@exp, [:x])
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).must_equal_via_send(@exp, [:x])
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `actual`, but got nil\b/)
            end
          end

        end

        describe "with `expect_value` nil" do

          specify "raise" do
            @exp.x = nil
            @act.x = :a
            expect {
              expect(@act).must_equal_via_send(@exp, [:x])
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).must_equal_via_send(@exp, [:x])
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `expect_value`, but got nil\b/)
            end
          end

        end

        describe "with `actual_value` nil" do

          specify "raise" do
            @exp.x = :a
            @act.x = nil
            expect {
              expect(@act).must_equal_via_send(@exp, [:x])
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).must_equal_via_send(@exp, [:x])
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `actual_value`, but got nil\b/)
            end
          end

        end

        describe "with `send_args` nil" do

          specify "raise" do
            @act.x = :a
            @exp.x = :a
            expect {
              expect(@act).must_equal_via_send(@exp, nil)
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).must_equal_via_send(@exp, nil)
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `send_args`, but got nil\b/)
            end
          end

        end

      end

    end

    describe "#wont_equal_via_send" do

      describe "with typical cases" do

        specify "valid" do
          @exp.x = :b
          @act.x = :a
          expect(@act).wont_equal_via_send(@exp, [:x])
        end

        specify "invalid" do
          @exp.x = :a
          @act.x = :a
          expect { 
            expect(@act).wont_equal_via_send(@exp, [:x])
          }.must_raise MiniTest::Assertion
          begin
            expect(@act).wont_equal_via_send(@exp, [:x])
          rescue MiniTest::Assertion => err
            expect(err.message).must_match(/\bExpected not equal\b/)
          end
        end

      end

      describe "with degenerate cases" do

        describe "with `expect` nil" do

          specify "raise" do
            @exp = nil
            @act.x = :a
            expect {
              expect(@act).wont_equal_via_send(@exp, [:x])
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).wont_equal_via_send(@exp, [:x])
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `expect`, but got nil\b/)
            end
          end

        end

        describe "with `actual` nil" do

          specify "raise" do
            @exp.x = :a
            @act = nil
            expect {
              expect(@act).wont_equal_via_send(@exp, [:x])
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).wont_equal_via_send(@exp, [:x])
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `actual`, but got nil\b/)
            end
          end

        end

        describe "with `expect_value` nil" do

          specify "raise" do
            @exp.x = nil
            @act.x = :a
            expect {
              expect(@act).wont_equal_via_send(@exp, [:x])
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).wont_equal_via_send(@exp, [:x])
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `expect_value`, but got nil\b/)
            end
          end

        end

        describe "with `actual_value` nil" do

          specify "raise" do
            @exp.x = :a
            @act.x = nil
            expect {
              expect(@act).wont_equal_via_send(@exp, [:x])
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).wont_equal_via_send(@exp, [:x])
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `actual_value`, but got nil\b/)
            end
          end

        end

        describe "with `send_args` nil" do

          specify "raise" do
            @exp.x = :a
            @act.x = :a
            expect {
              expect(@act).wont_equal_via_send(@exp, nil)
            }.must_raise MiniTest::Assertion
            begin
              expect(@act).wont_equal_via_send(@exp, nil)
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bExpected `send_args`, but got nil\b/)
            end
          end

        end

      end

    end

  end 

end

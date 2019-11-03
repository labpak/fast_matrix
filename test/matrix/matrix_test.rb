# frozen_string_literal: true
require 'test_helper'

module FastMatrixTest
  # noinspection RubyInstanceMethodNamingConvention
  class MatrixTest < Minitest::Test
    include FastMatrix

    def test_same
      m = Matrix[[1, 2]]
      assert_same m, m
    end

    def test_not_same
      refute_same Matrix[[1, 2]], Matrix[[1, 2]]
    end

    def test_eql
      m1 = Matrix[[1, 2, 3], [4, 5, 6]]
      m2 = Matrix[[1, 2, 3], [4, 5, 6]]
      assert m1.eql? m2
    end

    def test_not_eql_value
      m1 = Matrix[[1, 2, 3], [4, 5, 6]]
      m2 = Matrix[[1, 2, 3], [5, 5, 6]]
      refute m1.eql? m2
    end

    def test_not_eql_sizes
      m1 = Matrix[[1, 2, 3], [4, 5, 6]]
      m2 = Matrix[[1, 2, 3]]
      refute m1.eql? m2
    end

    def test_equal_by_value
      m1 = Matrix[[1, 2], [3, 4]]
      m2 = Matrix[[1, 2], [3, 4]]
      assert_equal m1, m2
    end

    def test_not_equal_by_value
      m1 = Matrix[[1, 2], [3, 4]]
      m2 = Matrix[[3, 4], [1, 2]]
      refute_equal m1, m2
    end

    def test_clone
      original = Matrix[[1, 2], [3, 4], [7, 0]]
      clone = original.clone

      assert_equal original, clone
      refute_same original, clone
    end

    def test_to_s
      m1 = Matrix[[1, 2], [3, 4]]
      assert_equal "FastMatrix::Matrix[[1.0, 2.0], [3.0, 4.0]]", m1.to_s
    end

    def test_inspect
      m1 = Matrix[[1, 2], [3, 4]]
      assert_equal "FastMatrix::Matrix[[1.0, 2.0], [3.0, 4.0]]", m1.inspect
    end

    def test_to_str
      m1 = Matrix[[1, 2], [3, 4]]
      assert_equal "FastMatrix::Matrix[[1.0, 2.0], [3.0, 4.0]]", m1.to_str
    end

    def test_symmetric
      m1 = Matrix[[1, 2, 1], [2, 4, 5], [1, 5, 3]]
      assert m1.symmetric?
    end

    def test_not_symmetric
      m1 = Matrix[[1, 2, 1], [3, 4, 5], [1, 5, 3]]
      refute m1.symmetric?
    end

    def test_symmetric_error
      m1 = Matrix[[1, 2], [3, 4], [1, 5]]
      assert_raises (IndexError) { m1.symmetric? }
    end

    def test_antisymmetric
      m1 = Matrix[[0, 2, 1], [-2, 0, 5], [-1, -5, 0]]
      assert m1.antisymmetric?
    end

    def test_not_antisymmetric
      m1 = Matrix[[0, 2, 1], [2, 0, 5], [-1, -5, 0]]
      refute m1.antisymmetric?
    end

    def test_antisymmetric_error
      m1 = Matrix[[1, 2], [3, 4], [1, 5]]
      assert_raises (IndexError) { m1.antisymmetric? }
    end
  end
end

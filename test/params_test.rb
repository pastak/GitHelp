# coding: utf-8

class GitHelpTest < Minitest::Test
  def test_params
    assert params(['3時間', '"b"', '8回']) == ['b']
  end
end


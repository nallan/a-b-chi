#encoding: utf-8

require 'test/unit'
require 'a-b-chi'

class ABChiTest < Test::Unit::TestCase

  def test_string_sort
    arr = ArrayChinese.new
    arr.push "李依恬", "李雲帆", "珍項小珍", "瑞芳", "李宗翰", "李彩雲", "李璨亘", "李若喬", "李瑞雰",  "李彩喬",  "李素霞", "李依帆", "NallaN",  "彩依恬", "彩雲恬", "雲李", "雲則欣", "雲彩雲"
    assert_equal ["李若喬", "李瑞雰", "李宗翰", "李彩喬", "李彩雲", "李璨亘", "李素霞", "李依帆", "李依恬", "李雲帆", "珍項小珍", "瑞芳", "彩依恬", "彩雲恬", "雲李", "雲則欣", "雲彩雲", "NallaN"],
    arr.sort
  end

end
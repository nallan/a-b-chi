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

  def test_blank_array
    arr = ArrayChinese.new
    arr.push 
    assert_equal [], arr.sort
  end

  def test_english_after_chinese
    arr = ArrayChinese.new
    arr.push "雲Z雲", "NallaN", "雲彩雲"
    assert_equal ["雲彩雲", "雲Z雲", "NallaN"],
    arr.sort
  end
  
  def test_handling_of_unknown_characters
    arr = ArrayChinese.new
    arr.push "Z∂ß", "NallaN", "雲彩雲"
    assert_equal ["雲彩雲", "NallaN", "Z∂ß"],
    arr.sort
  end

  def test_return_of_correct_non_markup
    str = StringChinese.new
    str << "珍項頇芳"
    assert_equal "珍(ㄓㄢ)項(ㄩㄣˇ)頇(ㄓㄨˋ)芳(ㄐㄧˊ)",
    str.to_ruby_unmarked
  end

    def test_return_of_correct_markup
      str = StringChinese.new
      str << "珍項頇芳"
      assert_equal "<ruby><rb>珍</rb><rp>(</rp><rt>ㄓㄢ</rt><rp>)</rp><rb>項</rb><rp>(</rp><rt>ㄩㄣˇ</rt><rp>)</rp><rb>頇</rb><rp>(</rp><rt>ㄓㄨˋ</rt><rp>)</rp><rb>芳</rb><rp>(</rp><rt>ㄐㄧˊ</rt><rp>)</rp></ruby>",
      str.to_ruby_markup
    end

end
require 'a-b-chi'



describe ArrayChinese do
  it "should sort an array correctly" do
    arr = ArrayChinese.new
    arr.push '項小珍','李瑞雰','李瑞芳','李則欣','李宗翰','李彩雲','李璨亘','李素霞','李依帆','李若喬','李依恬'
    arr.sort.should eq(["李若喬", "李瑞雰", "李瑞芳", "李則欣", "李宗翰", "李彩雲", "李璨亘", "李素霞", "李依帆", "李依恬", "項小珍"])
  end

  it "returns an empty array if one is passed to it" do
    arr = ArrayChinese.new
    arr.push
    arr.sort.should eq([])
  end

  it "should sort english after chinese" do
    arr = ArrayChinese.new
    arr.push "雲Z雲", "NallaN", "雲彩雲", "Z雲雲", "雲雲Z", "ZZ雲", "雲ZZ"
    arr.sort.should eq(["雲彩雲", "雲雲Z", "雲Z雲", "雲ZZ", "NallaN", "Z雲雲", "ZZ雲"])
  end

  it "should sort unknown characters after chinese and english" do
    arr = ArrayChinese.new
    arr.push "Z∂ß", "NallaN", "雲彩雲", " "
    arr.sort.should eq(["雲彩雲", "NallaN", "Z∂ß", " "])
  end

end

describe StringChinese do

  it "should return correct non-markup Characters and BoPoMoFo" do
    str = StringChinese.new
    str << "珍項頇芳"
    str.to_ruby_unmarked.should eq("珍(ㄓㄢ)項(ㄩㄣˇ)頇(ㄓㄨˋ)芳(ㄐㄧˊ)")
  end

  it "should return correctly marked up Characters and BoPoMoFo" do
    str = StringChinese.new
    str << "珍項頇芳"
    str.to_ruby_markup.should eq("<ruby><rb>珍</rb><rp>(</rp><rt>ㄓㄢ</rt><rp>)</rp><rb>項</rb><rp>(</rp><rt>ㄩㄣˇ</rt><rp>)</rp><rb>頇</rb><rp>(</rp><rt>ㄓㄨˋ</rt><rp>)</rp><rb>芳</rb><rp>(</rp><rt>ㄐㄧˊ</rt><rp>)</rp></ruby>")
  end

end
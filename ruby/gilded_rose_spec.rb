require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "generic items" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context "At the end of each day " do
      it "our system lowers quality for every item" do
        items = [Item.new("foo", 1, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 9
      end
    end

    context "At the end of each day " do
      it "our system lowers sell-in value for every item" do
        items = [Item.new("foo", 1, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
      end
    end    

    context "Once the sell by date has passed" do
      it "Quality degrades twice as fast" do
        items = [Item.new("foo", -1, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 8
      end
    end

    context "Quality is never negative" do
      it do
        items = [Item.new("foo", 2, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end
  end

  describe "aged brie" do
    context "The older aged brie gets" do
      it "the higher the quality" do
        items = [Item.new("Aged Brie", 2, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 2
      end
    end

    context "quality should not exceed 50" do
      it "" do
        
      end
    end

  end




end


 

# "Aged Brie"
# "Sulfuras, Hand of Ragnaros"
# "Backstage passes to a TAFKAL80ETC concert"
# "Generic item"
# TODO:
# "Conjured"

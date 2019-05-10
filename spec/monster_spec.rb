require 'monster'
require 'spec_helper'

describe Monster do
  before do
    @monster = Monster.new('Fakke')
    sleep(1)
    @monster.show_life
  end

  it 'show name of monster' do
    expect(@monster.name).to eq('Fakke')
  end

  it '#show_life' do
    expect(@monster.show_life).to eq(1)
  end
end

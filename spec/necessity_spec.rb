require 'necessity'
require 'spec_helper'

RSpec.describe Necessity do

  let(:necessity) { Necessity.new }

  it '#eat' do
    necessity.time_food
    expect(necessity.food).to eq(1)
    necessity.eat
    expect(necessity.food).to eq(0)
    expect(necessity.hygiene).to eq(1)
  end

  it '#amuse' do
    necessity.time_fun
    expect(necessity.fun).to eq(1)
    necessity.amuse
    expect(necessity.fun).to eq(0)
    expect(necessity.hygiene).to eq(1)
  end

  it '#sanitize' do
    necessity.time_hygiene
    expect(necessity.hygiene).to eq(1)
    necessity.sanitize
    expect(necessity.hygiene).to eq(0)
  end

  describe '#time_hygiene' do
    it 'return increment one case food and fun diffrent for' do
      necessity.time_hygiene
      necessity.time_hygiene
      necessity.time_hygiene
      necessity.time_food
      necessity.time_food
      necessity.time_hygiene
      expect(necessity.hygiene).to eq(4)
    end
    it 'return increment one case food and fun diffrent for' do
      necessity.time_hygiene
      necessity.time_food
      necessity.time_fun
      expect(necessity.hygiene).to eq(1)
    end
    it 'return duplicate increment' do
      necessity.time_hygiene
      necessity.time_hygiene
      necessity.time_food
      necessity.time_food
      necessity.time_food
      necessity.time_food
      necessity.time_hygiene
      expect(necessity.hygiene).to eq(4)
    end
  end

  describe '#time_fun' do
    it 'return increment one case food and fun diffrent for' do
      necessity.time_fun
      necessity.time_fun
      necessity.time_fun
      necessity.time_food
      necessity.time_food
      necessity.time_fun
      expect(necessity.fun).to eq(4)
    end
    it 'return increment one case food and fun diffrent for' do
      necessity.time_hygiene
      necessity.time_food
      necessity.time_fun
      expect(necessity.fun).to eq(1)
    end
    it 'return duplicate increment' do
      necessity.time_fun
      necessity.time_fun
      necessity.time_food
      necessity.time_food
      necessity.time_food
      necessity.time_food
      necessity.time_fun
      expect(necessity.fun).to eq(4)
    end
  end

  describe '#time_food' do
    it 'return increment one case food and fun diffrent for' do
      necessity.time_food
      necessity.time_food
      necessity.time_food
      necessity.time_fun
      necessity.time_fun
      necessity.time_food
      expect(necessity.food).to eq(4)
    end
    it 'return increment one case food and fun diffrent for' do
      necessity.time_food
      necessity.time_hygiene
      necessity.time_fun
      expect(necessity.fun).to eq(1)
    end
    it 'return duplicate increment' do
      necessity.time_food
      necessity.time_food
      necessity.time_fun
      necessity.time_fun
      necessity.time_fun
      necessity.time_fun
      necessity.time_food
      expect(necessity.food).to eq(4)
    end
  end
end

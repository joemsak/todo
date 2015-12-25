require 'spec_helper'

describe Todo::List do
  let(:list) { Todo::List.new }

  it 'adds multiple uncompleted todos' do
    garage = list.add_item('Clean the garage')
    trash = list.add_item('Take out the trash')

    expect(garage).not_to be_completed
    expect(garage).not_to be_completed
    expect(garage.text).to eq('Clean the garage')
    expect(trash.text).to eq('Take out the trash')
  end

  it 'completes items' do
    item = list.add_item('Clean the garage')
    item.complete!
    expect(item).to be_completed
  end

  it 'gives the user access to items still to be done' do
    garage = list.add_item('Clean the garage')
    trash = list.add_item('Take out the trash')

    trash.complete!

    expect(list.todo).to eq([garage])
  end

  it 'gives the user access to uncompleted todos' do
    garage = list.add_item('Clean the garage')
    trash = list.add_item('Take out the trash')

    trash.complete!

    expect(list.completed).to eq([trash])
  end
end

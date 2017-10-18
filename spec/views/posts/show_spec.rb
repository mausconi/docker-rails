require 'rails_helper'

describe 'posts/show' do
  before :each do
    @post = assign(:post, create(:post, title: 'Foo', content: '<p>Lorem ipsum</p>'))

    # Fix funny react_on_rails issue
    allow_any_instance_of(ActionController::TestRequest).to receive(:original_url).and_return('')
  end

  it 'renders attributes' do
    render

    assert_select 'h1', 'Foo'
    assert_select 'p', 'Lorem ipsum'
  end
end

require "spec_helper"

feature "Viewing a Thing" do
  given!(:thing)  { create(:thing) }
  given!(:viewer) { create(:user) }

  background do
    viewer.company = thing.user.company
    viewer.save
  end

  scenario "with an unviewed thing" do
    login_with viewer

    save_and_open_page

    click_link(thing.url)

    expect(thing.user_views.count).to eql(1)
  end
end

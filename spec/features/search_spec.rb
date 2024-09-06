# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search.
# (sweet potatoes should find more than 30,000 results)
# Then I should see a list of TEN foods that contain the ingredient "sweet potatoes"

# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients
require "rails_helper"

describe "Search functions" do
  it "should show a search to look for ingredients" do
    visit root_path
    fill_in :q, with: "sweet potatoes"
    click_button "Search"

    expect(current_path).to eq("/foods")
    expect(page).to have_content("Total number of items:")
    expect(page).to have_css("li.Food-Item", count: 10)

    within("ul.All-Foods") do
      expect(page).to have_content("GTIN/UPC:")
      expect(page).to have_content("Description:")
      expect(page).to have_content("Brand Owner:")
      expect(page).to have_content("Ingredients:")
    end
  end

  # it "should show a count of the number of items returned by the search" do
  #   visit root_path
  #   fill_in "Search", with: "sweet potatoes"
  #   click_button "Search"

  # end

  # it "should show a max of 10 food items" do
  #   visit root_path
  #   fill_in "Search", with: "sweet potatoes"
  #   click_button "Search"

  # end

  # it "should show the GTIN/UPC code, the description, the brand owner, and the ingredients" do
  #   visit root_path
  #   fill_in "Search", with: "sweet potatoes"
  #   click_button "Search"

  #   end
  # end
end
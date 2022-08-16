require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "creating a Booking" do
    visit bookings_url
    click_on "New Booking"

    fill_in "Animal name", with: @booking.animal_name
    fill_in "Animal type", with: @booking.animal_type
    fill_in "First name", with: @booking.first_name
    fill_in "Last name", with: @booking.last_name
    fill_in "Requested hours", with: @booking.requested_hours
    fill_in "Service date", with: @booking.service_date
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "updating a Booking" do
    visit bookings_url
    click_on "Edit", match: :first

    fill_in "Animal name", with: @booking.animal_name
    fill_in "Animal type", with: @booking.animal_type
    fill_in "First name", with: @booking.first_name
    fill_in "Last name", with: @booking.last_name
    fill_in "Requested hours", with: @booking.requested_hours
    fill_in "Service date", with: @booking.service_date
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking" do
    visit bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking was successfully destroyed"
  end
end

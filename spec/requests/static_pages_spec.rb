require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the content 'Survivor Pool'" do
      visit '/static_pages/home'
      page.should have_content('Survivor Pool')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Survivor Pool | Home")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "Survivor Pool | About")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_content('Contact Us')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title',
                        :text => "Survivor Pool | Contact")
    end
  end

  describe "Terms page" do

    it "should have the content 'Terms of Use'" do
      visit '/static_pages/terms'
      page.should have_content('Terms of Use')
    end

    it "should have the title 'Terms'" do
      visit '/static_pages/terms'
      page.should have_selector('title',
                        :text => "Survivor Pool | Terms")
    end
  end

  describe "Help page" do

    it "should have the content 'Get Help'" do
      visit '/static_pages/help'
      page.should have_content('Get Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "Survivor Pool | Help")
    end
  end
end
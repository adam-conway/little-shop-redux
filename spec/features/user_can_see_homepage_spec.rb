RSpec.describe 'User' do
  describe 'visits an homepage' do
    it 'can see homepage content' do
      visit "/"

      expect(page).to have_content("M & A's LittleShop")
    end
  end
end

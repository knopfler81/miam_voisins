require "rails_helper"

describe Notification do

  it { should belong_to(:user)}
  it { should belong_to(:topic)}
  it { should belong_to(:order)}


  describe "#mark_as_read" do
    it "returns true when the notification is read" do
      notif = create(:notification)

       read = notif.mark_as_read

       expect(read).to be_truthy
    end
  end

  describe '.unread' do
    it 'returns only unread notifications' do
      user = create(:user)
      notification_read = create(:notification, read: true, user: user)
      notification_unread = create(:notification, read: false, user: user)

      unread_notifications = Notification.unread(user)

      expect(unread_notifications.first).to eq(notification_unread)
    end
  end
end

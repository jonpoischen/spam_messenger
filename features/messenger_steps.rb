Given("Login to Messenger and spam") do
  visit "https://www.messenger.com/login.php?next=https%3A%2F%2Fwww.messenger.com%2Ft%2F" + "FRIENDS_NAME"

  find("//input[@id='email']").set("YOUR_EMAIL")
  find("//input[@id='pass']").set("YOUR_PASSWORD")
  find("//button[@id='loginbutton']").click

  def random_phrases
    phrases = ''
    5.times { phrases << "#{RandomWord.phrases.next.tr('_', ' ')} " }
    phrases
  end

  while
    find("//span[@data-offset-key]", visible: false, wait: 10)
    find("//span[@data-offset-key]", visible: false).send_keys(random_phrases.to_s)
    find("//a[@aria-label='Send']", visible: false).click
  end
end

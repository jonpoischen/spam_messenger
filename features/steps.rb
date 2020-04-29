Given("I login to Messenger and spam") do
  visit "https://www.messenger.com/login.php?next=https%3A%2F%2Fwww.messenger.com%2Ft%2F" + "FRIENDS_NAME"

  find("//input[@id='email']").set("YOUR_EMAIL")
  find("//input[@id='pass']").set("YOUR_PASSWORD")
  find("//button[@id='loginbutton']").click

  while find("//span[@data-offset-key]", visible: false, wait: 10)
    find("//span[@data-offset-key]", visible: false).send_keys(Quotable.random.to_s)
    find("//a[@aria-label='Send']", visible: false).click
  end
end

Given("I login to Messenger and spam with cat gifs") do
  visit "https://www.messenger.com/login.php?next=https%3A%2F%2Fwww.messenger.com%2Ft%2F" + "FRIENDS_NAME"

  find("//input[@id='email']").set("YOUR_EMAIL")
  find("//input[@id='pass']").set("YOUR_PASSWORD")
  find("//button[@id='loginbutton']").click

  amount = 250
  while
    cat_gif = Giphy.search('cat', {limit: 1, offset: rand(amount)}).to_s.split('"bitly_gif_url"=>"').last.split('",').first
    find("//span[@data-offset-key]", visible: false, wait: 10)
    find("//span[@data-offset-key]", visible: false).send_keys(cat_gif)
    sleep 3
    find("//a[@aria-label='Send']", visible: false).click
  end
end

Given("I QR code in to WhatsApp web and spam") do
  visit "https://web.whatsapp.com/"
  sleep 10

  first("//span[text()='FRIENDS_NAME']").click
  while find("//div[contains(@class,'copyable-text selectable-text') and @spellcheck]").send_keys(Quotable.random.to_s)
    find("//span[@data-icon='send']").click
  end
end

Given("I QR code in to WhatsApp web and spam with cat gifs") do
  visit "https://web.whatsapp.com/"
  sleep 10

  amount = 250
  first("//span[text()='FRIENDS_NAME']").click
  while
    cat_gif = Giphy.search('cat', {limit: 1, offset: rand(amount)}).to_s.split('"bitly_gif_url"=>"').last.split('",').first
    find("//div[contains(@class,'copyable-text selectable-text') and @spellcheck]").send_keys(cat_gif)
    sleep 3
    find("//span[@data-icon='send']").click
  end
end

Given("I login to LinkedIn and spam") do
  visit("https://www.linkedin.com/login?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin")

  find("//input[@id='username']").set("YOUR_EMAIL")
  find("//input[@id='password']").set("YOUR_PASSWORD")
  find("//div[@class='login__form_action_container ']//button").click

  if page.has_xpath?("//button[@class='secondary-action']")
    find("//button[@class='secondary-action']", wait: 5).click
  end

  visit("https://www.linkedin.com/messaging/thread/USER_ID_NUMBER_HERE/")

  while find("//div[contains(@class,'form__contenteditable ')]").send_keys(Quotable.random.to_s)
    sleep 0.2
    find("//button[contains(@class,'msg-form__send-button')]").click
  end
end

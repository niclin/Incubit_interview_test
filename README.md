[![Build Status](https://travis-ci.com/niclin/Incubit_interview_test.svg?branch=master)](https://travis-ci.com/niclin/Incubit_interview_test)

## Incubit, Inc. 的 Senior Web Developer (Rails) Code Test

Please implement a user registration system in Ruby on Rails. The system would require following features:
* As a user, I can visit sign up page and sign up with my email (with valid format and unique in database) and password (with confirmation and at least eight characters).
    * When I sign up successfully, I would see my profile page.
    * When I sign up successfully, I would receive a welcome email.
    * When I sign up incorrectly, I would see error message in sign up page.
* As a user, I can edit my username and password in profile page. I can also see my email in the page but I can not edit it.
    * When I first time entering the page, my username would be my email prefixing, e.g. (email is "user@example.com" , username would be "user")
    * When I edit my username, it should contain at least five characters. (Default username does not has this limitation)
* As a user, I can log out the system.
    * When I log out, I would see the login page.
* As a user, I can visit login page and login with my email and password.
* As a user, I can visit login page and click "forgot password" if I forgot my password.
    * When I visit forgot password page, I can fill my email and ask the system to send reset password email.
* As a user, I can visit reset password page from the link inside reset password email and reset my password (with confirmation and at least eight characters).
    * The link should be unique and only valid within six hours.


Please notice the following concerns when implementing:
* Do not use third party library for user registration. (e.g. Devise)
* Please use https://github.com/ryanb/letter_opener for the email in development environment.
* Write test code.
* Use Git for version control with well commit message.
* Write README.

After finish all the tasks, please submit it to Github and share the link to us.
Happy coding!

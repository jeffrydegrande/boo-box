As a site owner 
I want to use the boo-box API
So I can monetize my sites and buy a Veyron

  Scenario: call the API with a single tag
    Given a tag 'ruby on rails'
    And a username 'foobar'
    And a affiliate id 'mercadolivre'
    When I call the API
    Then I should see 'blah' 

67-272 Application Design and Development: Chess Store Project
===

This is the code for the 67-272 Chess Store Project. This online chess store allows customers to visit, create an account, view various items, order those items, and manage their personal information. In addition, shippers can login to account for items that need to be shipped to their appropriate locations and adjust the shipping list appropriately. Managers can make sure there is sufficient inventory, record new manufacture purchases, and adjust manufacturer prices. Administrators have complete control over all aspects of the application and can add/edit whatever they need into the system. This web application prototype focuses on designing the user's interactions and experience with the chess store app. It uses the model-view-controller pattern and ensures technical quality through hundreds of unit tests for 100% test coverage. 

To run the application locally, you will need to run `bundle install` to get the needed testing gems. You can populate the development database with realistic data by running `rake db:populate`.  All passwords are 'secret' in the system for all users. The list of known users include (username, role): 

- Mark ('mark', admin)
- Alex ('tank', admin)
- Karen ('kirvine', customer)
- Ben  ('bjunker', customer)
- Israel ('imadueme', customer)
- Mark V ('mvella', customer)
- Melanie ('melfree', customer)
- Rick ('rhuang', manager)
- Becca  ('bkern', manager)
- Connor ('chanley', shipper)
- Sarah ('srf', shipper)

Type in 'rails server' to the terminal and point the web browser to http://localhost:3000 to see the web app run!

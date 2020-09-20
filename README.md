# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* create 2 db with name : 
  
  - sehatQ_development
  - sehatQ_test

* run rails db:migrate

* run rails db:seed

and also the results of application generated locally using postman

1. Create an API for login and register by using email
  
  a. signup 
  - url :127.0.0.1:3000/signup
  - param 
      { 
       "administrator" : {
        "username": "aditya",
        "email":"adite@gmail.com",
        "password":"123456",
        "password_confirmation":"123456"
       }
      }
   - result
    ![Screen Shot 2020-09-20 at 21 08 16](https://user-images.githubusercontent.com/33482908/93714006-d91eff00-fb89-11ea-95ab-1b7bc2a78a0b.png)
   
   b. login 
   - url : 127.0.0.1:3000/auth/login
   - param 
      {"auth":
             {
               "email":"adite@gmail.com",
               "password":"123456"
             }
      }
    - result
      ![Screen Shot 2020-09-20 at 21 40 43](https://user-images.githubusercontent.com/33482908/93714036-0370bc80-fb8a-11ea-84bb-303f7e718fae.png)

2. Create an API list to display all doctors and hospitals
    
   - url : 127.0.0.1:3000/hospitalAndDoctor
   - result
    ![Screen Shot 2020-09-20 at 21 13 49](https://user-images.githubusercontent.com/33482908/93713987-c6a4c580-fb89-11ea-96b7-3d098dd4b913.png)

   
3. Create an API where user can book a schedule with doctor
    
   - url : 127.0.0.1:3000/book/create
   - param 
      { 
       "book" : {
        "id_doctor_schedule": "2",
        "id_administrator":"1",
        "state":"0"
       }
      }
   - result
    ![Screen Shot 2020-09-20 at 21 30 03](https://user-images.githubusercontent.com/33482908/93713947-86454780-fb89-11ea-9138-21e6e2f40e78.png)


4. The maximum user can book within 30 minutes before the doctor starts the schedule.
  
   - url : 127.0.0.1:3000/book/create
   - param same like number 3
   - result
    ![Screen Shot 2020-09-20 at 21 30 39](https://user-images.githubusercontent.com/33482908/93713923-44b49c80-fb89-11ea-9f42-8bc3ac8e265c.png)

5. A total of 10 users can book the same doctor.
  
   - url : 127.0.0.1:3000/book/create
   - param same like number 3
   - result
    ![Screen Shot 2020-09-20 at 21 14 44](https://user-images.githubusercontent.com/33482908/93713979-b260c880-fb89-11ea-804a-55dd180f24d4.png)


6. Create an API to display doctor schedule with patients
   
   - url : 127.0.0.1:3000/book/show
   - result
    ![Screen Shot 2020-09-20 at 21 15 44](https://user-images.githubusercontent.com/33482908/93713967-9f4df880-fb89-11ea-8326-897b7d4502d6.png)


7. Write unit test with Rspec

  - run rspec

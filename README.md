# OutsideOkay

Outside Okay is a website that was created at the height of the COVID-19 pandemic to help inform community residents about the risk of exposure to COVID-19. The site also informs users of techniques to prevent the spread of COVID-19 such as, washing your hands, wearing a mask, etc. A user is prompted to input their zipcode and based on the COVID-19 cases in their area, a percentage of exposure risk if returned. The cases were supplied by a New York Times repository that listed the active cases in every zip code of the United States. The formula was derived from communciations that our team had with an epidemiologist, but it should be noted it is not an exactly precise percentage. 

# SQL

The formula we used to calculate the exposure rate is as follows:

Exposure Risk = 1 - ( 1 - Previously Active * Transmissibility of Household) ^ (People)

Where the variables are:
Previously Active = Active Case Count / Population of the County
Active Case Count = Total Current COVID-19 Case Count in the County
People = How many people (include your household members) do you come into close contact (> 10 min, < 6 feet) within a week?
And the constant is:
Transmissibility of Household = 0.105 (According to the CDC)




# Nonfunctional Requirements
 
* **Performance Requirements**

Start with making sure that the database is updated regularly. Since we are using an open source repository on GitHub, we need to be sure that our database is updated every time the repository is updated, making our data accurate for the user. We can achieve this by using webhooks to act as an event listener. When the repository is updated our database will automatically send a pull request, so our data is current. Another issue concerning performance will be the backend server. If our website is receiving a high volume of traffic our network and server needs to be able to handle that traffic. 

* **Safety Requirements**

The main safety concern is the accuracy of our projections and formulas. It would not be safe to misinform the public during a global pandemic. So, with the proper research and resources, we can ensure that the predictions for probability of infection are accurate and not misleading. This means cross referencing the GitHub repository with other reliable sources, to make sure the number of cases, infections, deaths, etc. are backed up by credible information. In addition, finding a reliable formula that we can use to find the probability of infection using the available data. And finally, researching the specifics of COVID-19 to learn how much of a factor climate is, concerning transmission. 

* **Security Requirements**

As with any website that handles user input, it will be our responsibility to protect the user’s information. The users will need to input their zip code, county, and country for us to provide them with the correct information. We will need to ensure that our website keeps its confidentiality, integrity, and availability qualities to keep it safe for the users and usable by the public. We can do this be creating security measures on the front end and back end sides of the website to prevent attacks like XSS, DoS attacks, viruses, SQL Injection, etc. 

* **Software Quality Attributes**

On the back end we are planning to use Azure DevOps to create and test our server. This gives us the ability to share code easily and test our server in a contained virtual environment before it is deployed. The interoperability of DevOps will allow us to use Microsoft’s SQL Server to create the databases. GitHub’s repository and webhooks are compatible with SQL, so we will be able to pull and update our data using SQL Server. On the front end we will be using HTML, CSS, and JavaScript to create a functional and easy to use design. Lastly, we will implement Bootstrap to ensure our website has a responsive design and can be easily used on mobile devices. 

* **Business Rules**

Cameron oversees the databases, Erik is responsible for developing the back-end server, and Luciano will create the front-end design. We will support each other’s roles, and redistribute workload as needed. Communication will be enforced with frequent meetings, and constant contact within the group. Any additional help with the project or group will be sought through group emails (team members are cc’d) to the professor.  
Other Requirements
Extensive research on the repository will be needed, so we are certain the data we are using is open source. This will keep us out of any legal trouble and allow us to continue with the project. Another requirement is that we need to use webhooks in the database so that we are always pulling the most recent data and providing the most accurate results. 

# OutsideOkay

Outside Okay is a website that was created at the height of the COVID-19 pandemic to help inform community residents about the risk of exposure to COVID-19. The site also informs users of techniques to prevent the spread of COVID-19 such as, washing your hands, wearing a mask, etc. A user is prompted to input their zipcode and based on the COVID-19 cases in their area, a percentage of exposure risk if returned. The cases were supplied by a New York Times repository that listed the active cases in every zip code of the United States. The formula was derived from communciations that our team had with an epidemiologist, but it should be noted it is not an exactly precise percentage. 

The formula we used to calculate the exposure rate is as follows:

Exposure Risk = 1 - ( 1 - Previously Active * Transmissibility of Household) ^ (People)

Where the variables are:

    Previously Active = Active Case Count / Population of the County

    Active Case Count = Total Current COVID-19 Case Count in the County

    People = How many people (include your household members) do you come into close contact (> 10 min, < 6 feet) within a week?

And the constant is:

    Transmissibility of Household = 0.105 (According to the CDC)
    
# SQL



In lines 100-103, the stored procedure is being created and it is named ExposureRisk. It has two parameters, an input variable “zipCode” that is an integer and an output variable “risk” that is of type float. These, obviously, relate to the user’s zip code input and the program’s exposure risk percentage as an output.  In lines 104-105, we have our constant for our formulas declared as variables where @trans is the Transmissibility of Household variable and @nppl is the People variable.

Lines 107-113 were created because some counties have the same name as other counties in a different state. So, if the zip code the user enters checks just the county name in the uszips table and uses that county name to get the cases from the us-counties table then it will return multiple rows of data. That is why the two temporary variables tempc and tempst in these lines were created, so that the entered zip code is matching the state and county name in both tables and returning just one row of data. 

Lines 115-117 are to store the population of the county in the variable prevalence. The formula calls for the entire population of the county, so using the two variables above, tempc and tempst, to sum up the total population. We do this by using the sum() function to add up all the rows in the population column of table uszips where the county_name column equals tempc and the state_name column equals tempst. 

For our final variable, Active Case Count, in lines 119-124 we used a select statement to pull the value out of the case column in table us-counties. This was done by matching the county column to tempc and the state column to tempst to get the correct county. Since this repository is updated every couple of days, we needed to pull the latest data available which was done using the max() function with the date column (max(date)). 

After all the data had been assigned to the correct variables we were finally able to insert the formula into the procedure to produce our output variable risk. Lines 126-128 show how the Previously Active variable (prev_active) is assigned and how the formula assigns its result into the risk variable.
From here, the procedure just needs to be called with the user’s zip code as the parameter and we will be able to obtain the exposure risk for that county. The call goes as follows:

                                       `call ExposureRisk(@zipCode, @risk)`

Where the @zipCode variable is already declared and assigned to the user’s zip code and the @risk variable is the output variable that has not been declared or assigned a value yet. After the stored procedure is executed you can then return the @risk variable to the user. 



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

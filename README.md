CGTC Call Intelligence by Manjit Singh
        ===================
        ----------
        [See It in Action](https://youtu.be/-oQ3xrSLkfM)

        ----------

        The Call Intelligence application is built on Salesforce and Heroku. Heroku hosts the Twilio platform for handling calls and Salesforce hosts the Service Console application for representatives to call.

        The Call Intelligence application provides following functionalities:

        1. Identify Caller Location
        2. Identify the product of Interest
        3. Identify the page from where the user asked for call.
        4. Enables Representatives to log in to salesforce and call customers back
        5. Enables assignment of calls based on Country which can be easily expanded to region.
        6. Provide configurable options show potential sales calls to each rep.
        7. Ability to block numbers.
        8. Run reports based on each contact to see daily calls and see if the person is repeated caller or not.

        **Workflow**
        ----------

        1. A customer browses the page and requests a callback
        2. The site asks for customer phone and name.
        3. *Back-end Logic: Checks is the number is blocked or not else creates a calling record*
        4. The representative logs into Salesforce console application.
        5. The Calling Queue page auto refreshes to show the call inquiry.
        6. The representative calls back and closes the call.


        **Requirements**
        ----------

        - Salesforce Developer org with Service Cloud User License. **Winter 18**

        **Deployment Steps**
        ----------

        - Deploy the package to your org using workbench. [Video](https://youtu.be/CyWSAeQbANQ?t=2m4s)
        - Post Deployment
        - Goto Setup > Custom setting > CGTC_CallingNumber__c
        - Add value 2 in Time and 10 in number of records.
        - Provide access of the application and fields to representatives. A profile for testing is already incuded in the package.

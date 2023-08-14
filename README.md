# Docker Setup for the File Manager

This repository provides a Docker setup for deploying the File Manager locally. The File Manager consists of a Nextcloud instance, a custom API (Generic Layer) written in PHP, and a Flask RESTful API (Application Layer).

## Services

The Docker setup contains the following services:

1. Nextcloud Instance: This service serves both the Nextcloud instance and the API.
2. MariaDB Database: The Nextcloud instance depends on this database service.
3. Application Layer: This service serves the Flask RESTful API.

## Access URLs

The Nextcloud instance and the Custom API (Generic Layer) can be accessed using the following URLs:

- Nextcloud Instance: `https://localhost:8443`
- Custom API (Generic Layer) Endpoints: `https://localhost:8443/api/genapi.php/{endpoint}`
- Application Layer Endpoints: `http://127.0.0.1:5000/api/{endpoint}`

---

## Prerequisites

Before using this Docker setup, ensure that you have the following prerequisites installed:

- Docker: Follow the installation instructions for your operating system from the official Docker website: [https://www.docker.com/get-started](https://www.docker.com/get-started)
- Docker Compose: Refer to the Docker Compose installation guide: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

**Note:** Avoid using the `nistnet` network as it may cause issues with Docker due to VPN configurations.


### Start the File Manager

To set up the `File Manager Docker`, perform the following steps:

1. Open a terminal or command prompt.
2. Run the following command to clone the `File Manager Docker` repository:
   ```
   git clone --branch local https://gitlab.nist.gov/gitlab/mnm16/file-manager-docker
   ```
3. Navigate to this repository:
    ```
    cd file-manager-docker
    ```
4. Make the script executable if necessary:
    ```
    chmod +x start.sh
    ```
   
5. Run the script:
   ```
   ./start.sh
   ```

## First Usage

To get started with the application, follow these steps:

1. Open your browser and go to the Nextcloud instance using the URL `https://localhost:8443`. 

2. Create the admin user of the Nextcloud instance:
   - Username: `oar_api`
   - Password: `NISTnextcloudADMIN` 

3. Proceed with the installation of Nextcloud. Be sure to select `MySQL/MariaDB` as the Database.

4. Complete the installation as follows:
   - DB user: `admin` 
   - DB pwd: `dbpass1234` 
   - DB name: `nextcloud`
   - DB host: `mariadb:3306`

5. Skip recommended apps.

7. Enable the `SSO & SAML` app. This step is required for the creation of tables in the Database that are necessary for the API.

   - Once logged in, click on your profile picture or the avatar icon in the top-right corner of the Nextcloud interface.
   - From the drop-down menu, select `Apps` to access the Nextcloud App Store.
   - In the App Store, select `Featured Apps` and search for "SSO & SAML" in the list of apps.
   - Once you locate the "SSO & SAML" app, click on `Download and Enable`.

## Usage

To test the custom API, enter the following endpoint in a service like Postman:

- Post request to authenticate: `http://127.0.0.1:5000/api/auth`
- Use Basic Authentication with `oar_api` username and `NISTnextcloudADMIN` password.
- Copy the message returned, this is the JWT token to use to access all other endpoints.
- Get request to test the API: `http://127.0.0.1:5000/api/test`

If the API is working correctly, you should see the response `["GET","","api","genapi.php","test"]`.
# Standalone Docker Setup for the File Manager

This repository provides a Docker setup for deploying the File Manager as a standalone service locally. The File Manager consists of a Nextcloud instance, a custom API (Generic Layer) written in PHP, and a Flask RESTful API (Application Layer).

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
   git clone --branch standalone https://github.com/usnistgov/oar-file-manager-docker
   ```
3. Navigate to this repository:
    ```
    cd oar-file-manager-docker
    ```
4. Make the script executable if necessary:
    ```
    chmod +x start.sh
    ```
   
5. Run the script:
   ```
   ./start.sh
   ```

6. The File Manager should be up and running, ready to use!


## Usage

To test the file manager, enter the following endpoint in a service like Postman:

- Post request to authenticate: `http://127.0.0.1:5000/api/auth`
- Use Basic Authentication with `API_USER` and `API_PWD` values of the /config/.env file. Default values are `oar_api` and `NISTnextcloudADMIN`.
- Copy the message returned, this is the JWT token to use to access all other endpoints.
- Get request to test the API: `http://127.0.0.1:5000/api/test`

If the API is working correctly, you should see the response `["GET","","api","genapi.php","test"]`.

To stop the application, run the script:
 ```
 ./stop.sh
 ```

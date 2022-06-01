  
## Accessing Otomi console

- Sign in to the Otomi web console `url` using the `credentials` found in the installer job logs.

<!-- <p align="center"><img src="https://github.com/redkubes/marketplace-kubernetes/blob/main/img/otomi-console-login.png/?raw=true" width="100%" align="center" alt="otomi console login"></p> -->

  <img src="./img/otomi-console-login.png" alt="otomi console login" width="1080" height="570" align="center"/>

- Add the auto generated CA to your keychain/credential manager (optional)

<img src="./img/download-ca.png" alt="download ca" width="1080" height="570"/>

```bash
NOTE:
# To prevent you from clicking away lots of security warnings in your browser, you can add the generated CA to your keychain/credential manager:
# Since we install Otomi without proving a custom CA or using LetsEncrypt, the installer generated a CA which is not trusted on your local machine.
```

- In the left menu of Otomi Console, click on "Download CA"
- Double click the downloaded CA.crt or add the CA to your keychain on your mac using the following command:
  
  ```bash
  # On Mac
  sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ~/Downloads/ca.crt
  # Restart the browser or open it in private mode
  ```  

  ```powershell
  # On Windows(PowerShell - Run as Administrator)
  # Use certutil:
  certutil.exe -addstore root <downloaded cert path>
  # Or 
  Import-Certificate -FilePath "<downloaded cert path>" -CertStoreLocation Cert:\LocalMachine\Root
  # Restart the browser or open it in private mode
  ```

## Post-install configurations

- In the side menu of Otomi Console under `Platform`, select `Apps` and click on the **Drone** app
- Click on the `play` button in the top right. A new tab will open for Drone and click `CONTINUE`
- Sign in locally with as `otomi-admin` and the `password` provided in the logs of the installer job.
- Click on `Authorize Application`
- Click on `SUBMIT` on the Complete your Drone Registration page. You don't need to fill in your Email, Full Name or Company Name if you don't want to
- Click on the `otomi/values` repository
- Click on `+ ACTIVATE REPOSITORY`

<img src="./img/otomi-drone-activate.gif" alt="activate drone" width="1080" height="570"/>

## Checkout the hands-on labs
Explore Otomi through a series of hands-on [labs.](https://github.com/redkubes/workshops)

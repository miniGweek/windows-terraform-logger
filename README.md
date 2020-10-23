# windows-terraform-logger

## Description
- To log terraform commands and their outputs to a flat file for traceability and checking later. Terraform trace is too verbose, this logging will log whatever you see on the console and execution time.
- Uses Powershell modules and profile to achieve it.
- The folder is called uposh-terraform as in User Powershell Terraform. The folder structure and files follow powershell module conventions.

- Kudos and Thanks to **Nick Spreitzer** for blogging about how to write Powershell Modules in a simple straight forward manner @ https://refactorsaurusrex.com/post/2017/composing-a-powershell-module-from-multiple-script-files/  Made my life easier and made this possible.


## Usage
  Out of the box configuration / commands are as follows:
  - **tfi** : terraform init - logs start timetime , end and the time duration for execution (in ms).
  - **tfg** : terrafrom get -update , then terrafrom init - logs start timetime , end and the time duration for execution (in ms).
  - **tfp** : terraform plan ( supports arguments too!, uses Powershell's variable arguments capability to pass them to terraform ) - logs start timetime , end and the time duration for execution (in ms).
  - **tfa** : terraform apply ( supports arguments) - logs start timetime , end and the time duration for execution (in ms).

## Steps to configure it
1.  The folder **uposh-terraform** contains Powershell functions and is a Powershell module with a manifest. You will either need to put this folder in a directory which is already part of **PSModulePath** or you will need to add the directory to the **PSModulePath**. This is an environment variable so changing it is straight forward.
2.  The folder where you wish to log terraform outputs is referred to as the  log file path. Set the log file path directory inside `Set-UPoshTerraformVariables.ps1`. Should look something like `$env:uposhtfvar_tflogdirpath = "D:\Logs\"`. Alternatively you can just set an environment variable on your machine `uposhtfvar_tflogdirpath = "your log path directory" `
3.  Open Powershell profile file. Open Powershell and type in `notepad $profile`.
4.  Importing the module - Enter the following in your profile file `Import-Module '[Folder Location where you have kept the module]\uposh-terraform\uposh-terraform.psd1'`.
5.  Importing the functions - Add the following lines in your profile file.
    <span style="color:green">**Note**</span>: I am using **tfi** for `terraform init`, for example, feel free to choose your own aliases!
    ```Powershell
    Echo "Importing my terraform aliases"
    Set-UPoshTerraformVariables
    Set-Alias -Name tfi -Value Terraform-Init
    Set-Alias -Name tfp -Value Terraform-Plan
    Set-Alias -Name tfa -Value Terraform-Apply
    Set-Alias -Name tfg -Value Terraform-GetUpdate
    ```
6.  Save and close the profile - now next time you launch Powershell you should see something like: ( <span style="color:yellow">Ignore the warning regarding the uposh-terraform, if the warning bothers you - feel free to change the name of the module!! </span> )
    ```Powershell
    WARNING: The names of some imported commands from the module 'uposh-terraform' include unapproved verbs that might make them less discoverable. To find the commands with unapproved verbs, run the Import-Module command again with the Verbose parameter. For a list of approved verbs, type Get-Verb.

    Importing my terraform aliases
    ```

## Testing the aliases and taking it out for a ride...
  1.  If you have set it up right, then you should be able to logs like the following when you run the command `tfi` in a directory with terraform files :
      -  1st line should be starting with "Command Start"
      -  2nd Last Line should be "Command End"
      -  Last line should be Command duration ( time elapsed in milliseconds)
   ```Powershell
   ❯ tfi
Command running in directory C:\.......
Command Start - Terraform-Init at 23/10/2020 10:11:25 875
Initializing modules...

Initializing the backend...

Initializing provider plugins...
- Using previously-installed hashicorp/template v2.1.2
- Using previously-installed hashicorp/null v3.0.0
- Using previously-installed hashicorp/azurerm v2.32.0

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* hashicorp/null: version = "~> 3.0.0"
* hashicorp/template: version = "~> 2.1.2"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
Command End  - Terraform-Init at 23/10/2020 10:11:31 490
Command finished in directory C:\........
Command duration Terraform-Init : 5619
   ```
  2. Open the log file , the log file will have today's date as name. It will capture the exact content you see on the console. Every terraform command will be appended to the file and every day a new file will be generated.
   
## Contact
- I am reachable at rahul.git@outlook.com for suggestions, queries. Cheers!
  

# For the current version of the AWS CLI, use the following command
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

# For a specific version of the AWS CLI, append a hyphen and the version number
# to the filename. For this example the filename for version 2.0.30 would be
# awscli-exe-linux-aarch64-2.0.30.zip resulting in the following command:
# curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64-2.0.30.zip" -o "awscliv2.zip"

# Unzip the installer. If your Linux distribution doesn't have a built-in unzip
# command, use an equivalent to unzip it. The following example command unzips
# the package and creates a directory named aws under the current directory. 
unzip awscliv2.zip

# zRun the install program. The installation command uses a file named install
# in the newly unzipped aws directory. By default, the files are all installed
# to /usr/local/aws-cli, and a symbolic link is created in /usr/local/bin. The
# command includes sudo to grant write permissions to those directories. 
sudo ./aws/install

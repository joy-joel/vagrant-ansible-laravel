# Automate the Deployment of a LAMP (Linux, Apache, MySQL, PHP) stack.

-  I updated and upgraded the server packages to ensure that I have the latest versions installed
- installed the LAMP stack components - Apache, MySQL, PHP, and Ansible - along with the PHP SQLite3 extension. Not installing PHP SQLite will throw an error.
- I did an update on the package index again and installed additional PHP modules required for Laravel.
- To ensure PHP security, I configured the PHP.ini file to fix the cgi.fix_pathinfo setting
- Then I restarted the Apache server to apply the changes.
- I installed Composer to manage PHP dependencies.
-  I configured Apache virtual host for the Laravel application by creating a new virtual host configuration file
- I enabled the Apache rewrite module and the virtual host configuration.
- I cloned the laravel main websoite from Github.
- , I copied the `.env example` file and generate a new application key

- 
- 
- 
- 
# Get Latest HTTP Error 500
This is a simple bash script to get HTTP Error 500 within last 10 minutes

## Step Breakdown
The script are straight forward with this step :
1. Get logs directory from user input
2. Sort the files based on name and get the latest one
3. Get current time and deduct 10 minutes from now
4. Loop the entry inside the log file
5. Get date & time entry and compare with current time - 10 minutes _( for easy
calculation, I convert the datetime into epoch )_
6. Check status code, if match with 500, print the entry

## Running the script
The script needs the actual log files that have error 500 in the last 10 minutes, if not, it wont print anything. To run the script just run ``./last-10min-err500.sh`` and follow the instructions that are printed on the terminal.

## Author
Ari Pratama - @mamazary - www.aripratama.com

## License
This work is under [MIT license](https://opensource.org/licenses/MIT).

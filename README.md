# Time Task Logger

Log todays tasks in a csv

## Getting Started

To get started - pull down the repository.

## Quick Start
---
Use this application from the repo directory

```
ruby lib/time_task_logger.rb [command] [arguments]
```

## Commands
---

The time_task_logger commands are:

[--new](#--new)

[--message](#--message)

[--end](#--end)

[--delete](#--delete)

[--help](#--help)

---
### --New

Add a new entry to the csv

#### example
```
ruby lib/time_task_logger.rb --new test_entry
```
Will add a new entry called `test_entry`

---

### --Message

Add a message to the csv entry

#### example
```
ruby lib/time_task_logger.rb --message test_entry "Test Message"
```
Will add a message `Test Message` to the `test_entry`

*** Warning adding a new message with overwrite the old one ***

---

### --End

Add an end time to the csv entry

#### example
```
ruby lib/time_task_logger.rb --end test_entry 
```
Will add an end time to `test_entry`
Add add a the time difference between `start time` and `end time` in minutes.

*** Warning adding a new `end time` with overwrite the old one ***

---

### --delete

Delete a csv entry

#### example
```
ruby lib/time_task_logger.rb --delete test_entry 
```
Will delete `test_entry`
Before deletion happens, the user is prompted to type `yes` to accept deletion

---

### --help

Prints out commands






# Running the tests

This repo uses rspec for testing.
To install - run:
```
bundle install
```

Run the tests for all entry types with output.
```
rspec --format doc
```

# License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

# Acknowledgments

[Ruby](https://www.ruby-lang.org/en/)

[Ruby CSV](https://ruby-doc.org/stdlib-2.5.1/libdoc/csv/rdoc/CSV.html)

[rspec](http://rspec.info/)

[StackOverflow](https://stackoverflow.com/)
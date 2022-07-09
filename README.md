# Directory Pruner
A simple script in a container that cleans up all except the most recent X files in a specified directory.

# Usage

This will remove all but the most recent 40 files in /path/to/clean on your system:

    docker run -v /path/to/clean:/target -e RECENT_FILES_TO_KEEP=40 emmetog/directory-pruner

Or, if you need to override the dir inside the container that is cleaned:

    docker run -v /path/to/clean:/overriden-path -e DIR=/overridden-path -e RECENT_FILES_TO_KEEP=40 emmetog/directory-pruner

It's possible to get a list of the files that would be removed by setting the `DRY_RUN` env var to `true`:

    docker run -v /path/to/clean:/target -e RECENT_FILES_TO_KEEP=40 -e DRY_RUN=true emmetog/directory-pruner

# Warning

This **will delete things from the directory you specify**, permanently. So be very careful with it please. I don't
accept any responsibility for what happens as a result of you using this.

# Testing

To create a bunch of files in a dir, useful for testing this image, run this:

    mkdir /tmp/directory-pruner-test
    for i in {000..010}
    do
        echo "" > "/tmp/directory-pruner-test/file-${i}.txt"
    done

Then run this image on it and see what happens:

    # List the files before we start
    ls /tmp/directory-pruner-test

    # Do a dry run to see what would be cleaned up
    docker run -v /tmp/directory-pruner-test:/target -e RECENT_FILES_TO_KEEP=7 -e DRY_RUN=true emmetog/directory-pruner

    # Run a real cleanup
    docker run -v /tmp/directory-pruner-test:/target -e RECENT_FILES_TO_KEEP=7 emmetog/directory-pruner

    # List the files that are left
    ls /tmp/directory-pruner-test



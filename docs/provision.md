# Provisioning

Install knife solo and berkshelf via gem:

    $ sudo gem install knife-solo
    $ sudo gem install berkshelf

For a new server, create a json descriptor in the ```nodes/``` directory. See 33.33.33.10.json for a template.

First prepare the server:

    $ knife solo prepare user@33.33.33.10

Then "cook" it:

    $ knife solo cook user@33.33.33.10

You will only prepare once, but make sure it finishes. If there is any kind of error (like connectivity or memory),
first try to prepare the VM again. If it fails repeatedly, file an issue for this project with details.

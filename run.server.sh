#/bin/bash
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
    rvm use ruby-2.1.1
fi
rails server
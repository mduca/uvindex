@dir = "/var/www/uvindex/"

worker_processes 2
working_directory @dir 

timeout 30

# Socket for unicorn to listen to for nginx
listen "#{@dir}tmp/sockets/unicorn.sock", :backlog => 64 

# process id path
pid "#{@dir}tmp/pids/unicorn.pid"

stderr_path "#{@dir}log/unicorn-err.log"
stdout_path "#{@dir}log/unicorn-out.log"

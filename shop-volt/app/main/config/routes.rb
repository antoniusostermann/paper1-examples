# See https://github.com/voltrb/volt#routes for more info on routes

client '/admin', action: 'admin'

# The main route, this should be last. It will match any params not
# previously matched.
client '/', {}

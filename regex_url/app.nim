import prologue


# Handlers
proc matchA(ctx: Context) {.async.} =
    resp "This route matches \"a\" pattern"

proc matchB(ctx: Context) {.async.} =
    resp "This route matches \"b\" pattern"

proc matchXorYorZ(ctx: Context) {.async.} =
    resp "This route matches \"x\" or \"y\" or \"z\" pattern"

proc matchAnyWord(ctx: Context) {.async.} =
    resp "This route matches any word pattern"


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes with Regex patterns
app.addRoute(re"/a", matchA)
app.addRoute(re"/b", matchB)
app.addRoute(re"/[xyz]", matchXorYorZ)
app.addRoute(re"/(\w+)", matchAnyWord)

# Run instance
app.run()
# Creates Rprofile and Renvironment files which fix projects on DHSC Rstudio install

# RStudio startup
# https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/

# N.B. To get a list of all the environment variables which have been set you can run:
# Sys.getenv()
# Sys.getenv("R_USER") # gets the R_USER variable # P:/R/home

# The R Startup Sequence --------------------------------------------------

# __Run Startup Scripts----
# 1) run startup script in R Home directory: RSys.getenv("R_HOME") "C:/PROGRA~1/R/R-35~1.1"
# 2) set environment variables using R_HOME/etc/Reviron

# __Environment Variables ----
# 3) set _site_ variables using file pointed to by R_ENVIRON,
# or R_HOME/etc/Reviron.site

# 4) set _user_ variables using e pointed to by R_ENVIRON_USER
# or .Renviron in current dir
# or .Renviron in RHOME

# __RProfile----
# 5) set site profile using file pointed to by R_PROFILE,
# or R_HOME/etc/Rprofile.site

# 6) set site profile using file pointed to by R_PROFILE_USER,
# or R_HOME/etc/Rprofile.site



# The Problem -------------------------------------------------------------

# Our install was originally done for R as we didn't have RStudio

# This meant that a change was included in the packaged Rprofile.site file which
# breaks project functionality (It changes the working directory to the R Home
# directory by default)

# We also, cant without admin rights (dev account) overwrite the existing
# Rprofile.site in R_HOME which is in C:/ Program Files



# The Solution -------------------------------------------------------------

# We _can_ create an .Renviron file in  which sets the R_PROFILE environment
# variable. That is, we can use a .Renviron read at stage 4), to change which
# .Rprofile is read at stage 6).

# Adding an Rprofile to RUser if it doesn't exist ---------------------------

# check to see if .RProfile file exists and if not create
profile_path <- file.path(Sys.getenv("R_USER"), ".RProfile")

if (!file.exists(profile_path)) {
  profile_text <- '
  # Things you might want to change

  # options(papersize="a4")
  # options(editor="notepad")
  # options(pager="internal")

  # set the default help type
  # options(help_type="text")
  options(help_type="html")

  # set a site library
  # .Library.site <- file.path(chartr("\\", "/", R.home()), "site-library")

  # set a CRAN mirror
  # local({r <- getOption("repos")
  #       r["CRAN"] <- "http://my.local.cran"
  #       options(repos=r)})

  # Give a fortune cookie, but only to interactive sessions
  # (This would need the fortunes package to be installed.)
  #  if (interactive())
  #    fortunes::fortune()
  '
  cat(profile_text, file = profile_path)

  print('New Rprofile Written')

} else {

  cat(paste0('\nRprofile already present at: \n', profile_path, '\nNo change made\n'),
      file = '')

}


# Adding an .Renviron to point to our new .Rprofile -------------------------

# check to see if .REnviron file exists and if not create it
env_path <- file.path(Sys.getenv("R_USER"), ".Renviron")

if (!file.exists(env_path)) {
  env_text <- 'R_PROFILE="${R_USER}/.RProfile"'

  cat(env_text, file = env_path)

  print('New Renviron Written')

} else {

  cat(paste0('\nRenviron already present at: \n',env_path,'\nNo change made'),
      file = '')

}

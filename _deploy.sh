# configure your name and email if you have not done so
git config --global user.email "matthew.malcher@dhsc.gov.uk"
git config --global user.name "Matthew Malcher"

# clone the repository to the book-output directory
git clone -b gh-pages \
  https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git \
  book-output

# set wd as book-output directory
cd book-output

# delete all files in book-output from the git index
git rm -rf *

#copy everything from _book in the main directory to
cp -r ../docs/* ./

git add --all *
git commit -m"Update the book"
git push -q origin gh-pages

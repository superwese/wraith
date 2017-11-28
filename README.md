![Wraith logo](https://raw.githubusercontent.com/BBC-News/wraith/master/assets/wraith-logo.png)


Wraith is a screenshot comparison tool, created by developers at BBC News.

This fork publishes a Docker image named 'superwese/wraith-chrome' to the docker registry.
Neither casperjs nor phantomjs is installed.


The enclosed wraith version is patched:
-There is an additional `setup_folders() when running `wraith latest` to ensure the directory structure exists when screenshots are taken.
-`---no-sandbox` is added to the `chrome.options` so chrome runs in the container.  


[Documentation](http://bbc-news.github.io/wraith/) • [Source](http://github.com/`uperweses/wraith) 


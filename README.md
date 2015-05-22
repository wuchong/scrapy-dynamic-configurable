# Scrapy Dynamic Configurable

A dynamic configurable news crawler based Scrapy. See the [blogs](http://wuchong.me/blog/2015/05/22/running-scrapy-programmatically) for more detail.

##Requirements

- Scrapy
- MySQL
- Redis
- SQLAlchemy

##Install in development

**Mac OS X, use Homebrew**

```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install mysql
$ brew install redis
$ sudo pip install scrapy
$ sudo pip install SQLAlchemy
$ sudo pip install redis
```
**Ubuntu***

```bash
$ sudo apt-get install redis-server mysql-server mysql-client
$ pip install scrapy
$ pip install SQLAlchemy
$ pip install redis
```
**and restore datatables from 'db.sql'**


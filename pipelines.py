# -*- coding: utf-8 -*-

import json
import codecs
from scrapy.exceptions import DropItem
from model.config import DBSession
from model.config import Redis
from model.article import Article

# 去重
class DuplicatesPipeline(object):
    def process_item(self, item, spider):
        if Redis.exists('url:%s' % item['url']):
            print 'aaaaaaaaaaaaaa'
            raise DropItem("Duplicate item found: %s" % item)
        else:
            Redis.set('url:%s' % item['url'],1)
            print 'bbbbbbbbbbbbb'
            return item

# 存储到数据库
class DataBasePipeline(object):
    def open_spider(self, spider):
        self.session = DBSession()

    def process_item(self, item, spider):
        a = Article(title=item["title"].encode("utf-8"),
                    url=item["url"],
                    body=item["body"].encode("utf-8"),
                    publish_time=item["publish_time"].encode("utf-8"),
                    source_site=item["source_site"].encode("utf-8"))
        self.session.add(a)
        self.session.commit()
        print 'ccccccccccc'

    def close_spider(self,spider):
        self.session.close()

# 存储到文件
class JsonWriterPipeline(object):

    def __init__(self):
        self.file = codecs.open('items.json', 'w', encoding='utf-8')

    def process_item(self, item, spider):
        line = json.dumps(dict(item)) + "\n"
        self.file.write(line.decode('unicode_escape'))
        return item

# 爬取指定条数 100条
class CountDropPipline(object):
    def __init__(self):
        self.count = 100

    def process_item(self, item, spider):
        if self.count == 0:
            raise DropItem("Over item found: %s" % item)
        else:
            self.count -= 1
            return item
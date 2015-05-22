# -*- coding: utf-8 -*-
from spiders.deep_spider import DeepSpider
from model.config import DBSession
from model.rule import Rule

# scrapy api
from scrapy import signals, log
from twisted.internet import reactor
from scrapy.crawler import Crawler
from scrapy.settings import Settings


RUNNING_CRAWLERS = []

def spider_closing(spider):
    """Activates on spider closed signal"""
    log.msg("Spider closed: %s" % spider, level=log.INFO)
    RUNNING_CRAWLERS.remove(spider)
    if not RUNNING_CRAWLERS:
        reactor.stop()

log.start(loglevel=log.DEBUG)

settings = Settings()

# crawl settings
settings.set("USER_AGENT", "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36")
settings.set("ITEM_PIPELINES" , {
    'pipelines.DuplicatesPipeline': 200,
    # 'pipelines.CountDropPipline': 100,
    'pipelines.DataBasePipeline': 300,
})

db = DBSession()
rules = db.query(Rule).filter(Rule.enable == 1)
for rule in rules:
    crawler = Crawler(settings)
    spider = DeepSpider(rule)  # instantiate every spider using rule
    RUNNING_CRAWLERS.append(spider)

    # stop reactor when spider closes
    crawler.signals.connect(spider_closing, signal=signals.spider_closed)
    crawler.configure()
    crawler.crawl(spider)
    crawler.start()

# blocks process so always keep as the last statement
reactor.run()
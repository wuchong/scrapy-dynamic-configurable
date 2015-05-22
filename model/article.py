# -*- coding: utf-8 -*-
from sqlalchemy import Column, String , DateTime, Integer
from sqlalchemy.ext.declarative import declarative_base

# 创建对象的基类:
Base = declarative_base()

# 定义User对象:
class Article(Base):
    # 表的名字:
    __tablename__ = 'articles'

    # 表的结构:
    id = Column(Integer, primary_key=True)
    title = Column(String)
    url = Column(String)
    body = Column(String)
    publish_time = Column(DateTime)
    source_site = Column(String)


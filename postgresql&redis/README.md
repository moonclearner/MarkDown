# postgresql & redis
- postgresql 可以直接读写 redis
- redis 可以作为 postgresql 二级缓存

## redis 作为 postgresql 二级缓存
例如在生产中有多台 redis 主机或集群，使用 redis 扩展 PG 的二级缓存能力，减少对 IO 的需求
这个完全可以做成触发器形式的，数据插入或更新的时候，同时插入或更新到 redis
删除的时候，从 redis 删除
用来做二级缓存时，更新从 postgresql 直接操作 redis 来减少总的交互次数
查询时直接查询 redis 或者从 postgresql 去查询 redis 都是可以的，如果是乐观的情况，从 redis 去查是 OK 的，如果是悲观的情况则从 postgresql 去读，同时写入 redis

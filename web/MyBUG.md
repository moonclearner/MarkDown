## operationalerror
incorrect string value” error when save unicode string in Django

### solution:
this answer: columns can have their own character sets, independent of the tables and the database.

like columns content: lantin must be utf8

```sql
ALTER TABLE database.table MODIFY COLUMN content VARCHAR(255)
    CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
```

## utf8 or utf8mb4 in mysql
MySQL 在 5.5.3 之后增加了这个 utf8mb4 的编码，mb4 就是 most bytes 4 的意思，专门用来兼容四字节的 unicode。好在 utf8mb4 是 utf8 的超集，除了将编码改为 utf8mb4 外不需要做其他转换。当然，为了节省空间，一般情况下使用 utf8 也就够了。

utf8 是 Mysql 中的一种字符集，只支持最长三个字节的 UTF-8 字符，也就是 Unicode 中的基本多文本平面。

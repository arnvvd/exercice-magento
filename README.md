Magento Project
===============
HETIC Project / 3 - 7 april 2017

## How to install on your local machine
**Configuring the Database**  
Before you really begin, you'll need to configure your database connection information. By convention, this information is usually configured in an `app/etc/local.xml` file:

```xml
/**
* app/etc/local.xml
*/
<connection>
    <host><![CDATA[localhost]]></host>
    <username><![CDATA[root]]></username>
    <password><![CDATA[myMdp]]></password>
    <dbname><![CDATA[magento]]></dbname>
    <initStatements><![CDATA[SET NAMES utf8]]></initStatements>
    <model><![CDATA[mysql4]]></model>
    <type><![CDATA[pdo_mysql]]></type>
    <pdoType><![CDATA[]]></pdoType>
    <active>1</active>
</connection>
```
### and then...
- Import the `./magento.sql` in your Phpmyadmin   
- Change in the databases in the `magev1_core_config_data` table the lines `web/unsecure/base_url` and `web/secure/base_url`
- Enjoy

## About Server
ADDRESS ID: 5.44.25.230  
USER: root  
MDP: poneyponey

### SSH Access
```bash
$ ssh root@5.44.25.230
```

## About Database
USER: root  
MDP: poneyponeymysql

## Back Office Admin
http://5.44.25.230/mageadmin  
username: poney  
password: hetichetic1

## Our Team
- Lisa
- Theo
- Medrick
- Arnaud
- Nicolas

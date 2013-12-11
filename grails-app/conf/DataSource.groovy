//dataSource {
//    pooled = true
//   // driverClassName = "com.mysql.jdbc.Driver"
//   // dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
//   
//}
//hibernate {
//    cache.use_second_level_cache = true
//    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
//}
//// environment specific settings
//environments {
//    development {
//        dataSource {
//           url = "http://dimes.jonleung.net/cpanel"
//            // logSql = true
//            username = "dimes"
//            password = "Kinectall01"
//            
//        }
//    }
//    test {
//        dataSource {
//            pooled = true
//            driverClassName = "com.mysql.jdbc.Driver"
//            url = "http://dimes.jonleung.net/cpanel"
//            // logSql = true
//            username = "dimes"
//            password = "Kinectall01"
//            
//              
//          
//        }
//    }
//}
//  
//production {
//    dataSource {
//        pooled = true
//        driverClassName ="com.mysql.jdbc.Driver"
//        url = "http://dimes.jonleung.net/dimes_main"
//        userName="dimes_admin"
//        password="Kinectall01"
//        dialect = org.hibernate.dialect.MySQL5InnoDBDialect
//          
//        properties {
//            maxActive = -1
//            minEvictableIdleTimeMillis=1800000
//            timeBetweenEvictionRunsMillis=1800000
//            numTestsPerEvictionRun=3
//            testOnBorrow=true
//            testWhileIdle=true
//        }
//    }
//}

////********************************************
    dataSource {
pooled = true
driverClassName = "com.mysql.jdbc.Driver"
username = "root"
password = "password"
}
hibernate {
cache.use_second_level_cache = true
cache.use_query_cache = false
cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
development {
dataSource {
dbCreate = "update" // one of 'create', 'create-drop','update'
url = "jdbc:mysql://localhost:3306/dimesapp"
 //url =  "jdbc:mysql://dimes.jonleung.net:8080/dimes_main"

}
}
test {
dataSource {
dbCreate = "update"
url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
}
}
production {
dataSource {
dbCreate = "update"
url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
pooled = true
properties {
maxActive = -1
minEvictableIdleTimeMillis=1800000
timeBetweenEvictionRunsMillis=1800000
numTestsPerEvictionRun=3
testOnBorrow=true
testWhileIdle=true
testOnReturn=true
validationQuery="SELECT 1"
}
}
}
}

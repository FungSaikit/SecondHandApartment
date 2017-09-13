import groovy.sql.Sql

class test {
    static void main(String[] args) {
        def sql = Sql.newInstance('jdbc:mysql://localhost:3306/SecondHandApartment?useUnicode=true&characterEncoding=utf-8', 'root', 'admin', 'com.mysql.jdbc.Driver')

        sql.eachRow('select * from SecondHandHouse'){
            tp -> println([tp])
        }

    }
}

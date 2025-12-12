package util;


import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
    private static final SqlSessionFactory sqlSessionFactory = build();

    private static SqlSessionFactory build() {
        try {
            InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
            return new SqlSessionFactoryBuilder().build(in);
        } catch (Exception e) {
            throw new RuntimeException("Failed to build SqlSessionFactory", e);
        }
    }

    public static SqlSessionFactory getFactory() {
        return sqlSessionFactory;
    }
}

package com.app.bewodeurim.mapper.driver;

import com.app.bewodeurim.domain.driver.DriverDTO;
import com.app.bewodeurim.domain.driver.DriverVO;
import org.apache.ibatis.annotations.Mapper;

import java.sql.Driver;

@Mapper
public interface DriverMapper {
    //기사정보 입력

    public void insertDriverInfo(DriverVO driverVO);
}

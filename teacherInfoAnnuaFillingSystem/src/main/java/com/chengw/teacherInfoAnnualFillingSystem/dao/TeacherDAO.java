package main.dao;

import main.model.Teacher;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface TeacherDAO {

    Teacher getTeacherByUsername(@Param("username") String username);

    List<Teacher> getAllTeacher();



}

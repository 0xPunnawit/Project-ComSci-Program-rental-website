package com.example.Tutorials_Eom.service;


import com.example.Tutorials_Eom.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // ฟังก์ชันสำหรับดึงจำนวนผู้ใช้ทั้งหมด
    public Integer getUserCount() {
        return userRepository.countUserIds(); // ใช้ count() ของ UserRepository เพื่อดึงจำนวนผู้ใช้
    }

}
